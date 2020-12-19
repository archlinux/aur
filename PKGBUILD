# Maintainer: robertfoster
# Missing PERL deps (at least for now)
# perl-geography-countries
# perl-socket-linux
# perl-unix-getrusage
# perl-ipc-cmd
# perl-io-sessiondata
# perl-mail-spamassassin
# perl-swatchdog
# perl-unix-syslog
# perl-crypt-saltedhash
# perl-db-file
# perl-xml-parser-lite

pkgname=zimbra
pkgbase=zimbra
pkgver=9.0.0.p10
pkgrel=1
pkgdesc="An enterprise-class email calendar and collaboration solution built for the cloud both public and private"
arch=(x86_64)
url="https://www.zimbra.com/open-source-email-overview/"
license=(CPAL)
depends=(
  'java-runtime>=11' 'perl-data-uuid' 'perl-dbi' 'perl-file-grep'
  'perl-ldap' 'perl-net-dns' 'perl-net-http' 'perl-netaddr-ip'
  'perl-unix-syslog'
  'perl-xml-parser' 'perl-xml-sax' 'perl-xml-sax-base' 'perl-xml-simple')
makedepends=('maven' 'ant' 'java-hamcrest' 'jdk8-openjdk' 'junit' 'lsb-release' 'rsync' 'ruby')
install=

# Zimbra Configuration Variables
_buildtype="FOSS"
_major=$(echo "${pkgver}" | cut -d'.' -f1)
_micro=$(echo "${pkgver}" | cut -d'.' -f3)
_minor=$(echo "${pkgver}" | cut -d'.' -f2)
_os="ARCH"
_ostag="arch"
_rc="GA"
_release="KEPLER"
_releaseno="${pkgver%.*}"
_timestamp=$(date +'%Y%m%d')

source=("git+https://github.com/Zimbra/zm-build#tag=${_releaseno}" # Repo list is synced with instructions/FOSS_repo_list.pl
  "git+https://github.com/M0Rf30/zimbra-package-stub"              # A fork of mine to detect Arch
  "git+https://github.com/Zimbra/ant-1.7.0-ziputil-patched#tag=${_releaseno}"
  "git+https://github.com/Zimbra/ant-tar-patched#tag=${_releaseno}"
  "git+https://github.com/Zimbra/ical4j-0.9.16-patched#tag=${_releaseno}"
  "git+https://github.com/kohlschutter/junixsocket#tag=junixsocket-parent-2.0.4"
  "git+https://github.com/Zimbra/nekohtml-1.9.13#tag=${_releaseno}"
  "git+https://github.com/Zimbra/java-html-sanitizer-release-20190610.1#tag=${_releaseno}"
  "git+https://github.com/Zimbra/antisamy#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-admin-console#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-admin-help-common#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ajax#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-admin-ajax#tag=${_releaseno}.p8"
  "git+https://github.com/Zimbra/zm-amavis#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-aspell#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-bulkprovision-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-bulkprovision-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-certificate-manager-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-certificate-manager-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-charset#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clam-scanner-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clientuploader-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clientuploader-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-core-utils#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-db-conf#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-dnscache#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-downloads#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-freshclam#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-help#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-helptooltip-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-jetty-conf#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-jython#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-launcher#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ldap-utilities#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ldap-utils-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-licenses#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-mailbox#tag=${_releaseno}.p10"
  "git+https://github.com/Zimbra/zm-migration-tools#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-mta#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-nginx-conf#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-nginx-lookup-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-openid-consumer-store#tag=${_releaseno}"
  "git+https://github.com/M0Rf30/zm-pkg-tool#tag=${_releaseno}.arch.p7" # A fork of mine to support Arch
  "git+https://github.com/Zimbra/zm-postfix#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-proxy-config-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ssdb-ephemeral-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-taglib#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-timezones#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-versioncheck-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-versioncheck-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-versioncheck-utilities#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-viewmail-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-web-client#tag=${_releaseno}.p10"
  "git+https://github.com/Zimbra/zm-webclient-portal-example#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-zcs#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-zcs-lib#tag=${_releaseno}.p4"
  "git+https://github.com/Zimbra/zm-zimlets#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-oauth-social#tag=${_releaseno}.p7"
  "git+https://github.com/Zimbra/zm-gql#tag=${_releaseno}"
  "zimbra.sysusers"
  "zimbra.tmpfiles"
  "localconfig.xml"
  "arch-patch.diff"
)
noextract=()

prepare() {
  cd "${srcdir}"

  # Add support for Arch in some scripts
  patch -Np0 -i arch-patch.diff
}

build() {
  cd "${srcdir}/zm-build"

  # Set JDK 8 as runtime
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export JAVA_PATH=/usr/lib/jvm/java-8-openjdk/bin

  # Let's build for real now
  ./build.pl -build-no=${pkgrel} --build-ts=${_timestamp} \
    --build-release=${_release} --build-release-no=${_releaseno} \
    --build-os=${_os} --build-release-candidate=${_rc} --build-type=${_buildtype} \
    --build-arch=$CARCH --pkg-os-tag=${_ostag} \
    --build-thirdparty-server=files.zimbra.com --no-interactive \
    --build-prod-flag --ant-options="-DskipTests=1"
}

package() {
  cd "${srcdir}"
  find zm-mailbox/build/stage \
    -type d \
    -name "opt" \
    -exec rsync -av {} "${pkgdir}" \;

  cd .staging/${_os}-${_release}-${_major}${_minor}${_micro}-${_timestamp}-${_buildtype}-${pkgrel}

  find . -type d \
    -name "opt" \
    -exec rsync -av {} "${pkgdir}" \;
  find . -type d \
    -name "sudoers.d" -exec rsync -av {} "${pkgdir}/etc" \;
  find . -type d \
    -name "conf" -exec rsync -av {} "${pkgdir}"/opt/zimbra \;
  find zm-zcs-lib -type f \
    -iname "*.jar" \
    -exec rsync -av {} "${pkgdir}"/opt/zimbra/lib/jars \;

  chmod 750 -R ${pkgdir}/etc/sudoers.d
  chmod +x ${pkgdir}/opt/zimbra/bin/*

  # systemd
  #	install -D -m644 "${srcdir}/zimbra.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/zimbra.sysusers" "${pkgdir}/usr/lib/sysusers.d/zimbra.conf"
  install -D -m644 "${srcdir}/zimbra.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/zimbra.conf"

  # Using a pregenerated localconfig.xml to set JRE
  install -D -m644 "${srcdir}/localconfig.xml" "${pkgdir}/opt/zimbra/conf/localconfig.xml"
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '21b3bdbcb2d23357104122df3de217b5'
         '84ad300287d602d4d6b2601748ddbaac'
         '9c97f489e0fa84a7be0a0dec593fd946'
         '693dabf11d6994537f91e6b1d11f2e03')
