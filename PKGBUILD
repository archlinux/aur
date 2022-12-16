# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Det <nimetonmaili g-mail>

set -u
_pkgname='jdk'
_major='8'
pkgname="${_pkgname}${_major}"
#_minor='212'; _build='b10'; _hash='59066701cf1a433da9770636fbc4c9aa'
#_minor='221'; _build='b11'; _hash='230deb18db3e4014bb8e3e8324f81b43'
#_minor='231'; _build='b11'; _hash='5b13a193868b4bf28bcb45c792fce896'
#_minor='241'; _build='b07'; _hash='1f5b5a70bf22433b84d0e960903adac8'
#_minor='251'; _build='b08'; _hash='3d5a2bb8f8d4428bbe94aed7ec7ae784'
#_minor='261'; _build='b12'; _hash='a4634525489241b9a9e1aa73d9e118e6'
#_minor='271'; _build='b09'; _hash='61ae65e088624f5aaa0b1d2d801acb16'
#_minor='281'; _build='b09'; _hash='89d678f2be164786b292527658ca1605'
#_minor='291'; _build='b10'; _hash='d7fc238d0cbf4b0dac67be84580cfb4b'
#_minor='301'; _build='b09'; _hash='d3c52aa6bfa54d3ca74e617f18309292'
#_minor='311'; _build='b11'; _hash='4d5417147a92418ea8b615e228bb6935'
#_minor='331'; _build='b09'; _hash='165374ff4ea84ef0bbd821706e29b123'
#_minor='333'; _build='b02'; _hash='2dee051a5d0647d5be72a7c0abff270e'
#_minor='341'; _build='b10'; _hash='424b9da4b48848379167015dcc250d8d'
_minor='351'; _build='b10'; _hash='10e8cce67c7843478f41411b7003171c'
pkgver="${_major}u${_minor}"
pkgrel='1'
pkgdesc="Oracle Java ${_major} Development Kit"
pkgdesc+=' LTS'
arch=('x86_64')
url='https://www.oracle.com/technetwork/java/javase/downloads/index.html'
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
depends+=('java-environment-common')
optdepends=(
  'alsa-lib: for basic sound support'
  'gtk2: for Gtk+ look and feel (desktop)'
  'eclipse-java: to use "Oracle Java Mission Control" plugins in Eclipse'
)
makedepends=('awk')
provides=(
  "java-runtime=${_major}"
  "java-runtime-headless=${_major}"
  "java-web-start=${_major}"
  "java-runtime-jre=${_major}"
  "java-runtime-headless-jre=${_major}"
  "java-web-start-jre=${_major}"
  "java-openjfx=${_major}"
  "java-environment=${_major}"
  "java-environment-jdk=${_major}"
)

# Variables

_jname="${_pkgname}${_major}"
_jvmdir="/usr/lib/jvm/java-${_major}-${_pkgname}"

backup=(
  "etc/java-${_jname}/amd64/jvm.cfg"
  "etc/java-${_jname}/images/cursors/cursors.properties"
  "etc/java-${_jname}/management/jmxremote.access"
  "etc/java-${_jname}/management/management.properties"
  "etc/java-${_jname}/security/java.policy"
  "etc/java-${_jname}/security/java.security"
  "etc/java-${_jname}/security/javaws.policy"
  "etc/java-${_jname}/content-types.properties"
  "etc/java-${_jname}/flavormap.properties"
  "etc/java-${_jname}/fontconfig.properties.src"
  "etc/java-${_jname}/logging.properties"
  "etc/java-${_jname}/net.properties"
  "etc/java-${_jname}/psfont.properties.ja"
  "etc/java-${_jname}/psfontj2d.properties"
  "etc/java-${_jname}/sound.properties"
)
options=('!strip') # JDK debug-symbols
install="${pkgname}.install"
_srcfil="${_pkgname}-${pkgver}-linux-x64.tar.gz"
source=(
  "https://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/${_srcfil}"
  "jconsole-${_jname}.desktop"
  "jmc-${_jname}.desktop"
  "jvisualvm-${_jname}.desktop"
  "policytool-${_jname}.desktop"
  'readme.sh'
)
# from oracle-sqldeveloper
if :; then
DLAGENTS+=("manual::${startdir:-}/readme.sh ${url} %o %u")
source[0]="manual://${_srcfil}"
if [ ! -z "${HOME:-}" ]; then # block mksrcinfo
  XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD 2>/dev/null)" || :
  if [ -z "${XDG_DOWNLOAD_DIR}" ]; then
    XDG_DOWNLOAD_DIR=~/'Downloads'
  fi
  if [ -s "${XDG_DOWNLOAD_DIR}/${_srcfil}" ] && [ ! -e "${_srcfil}" ]; then
    if type msg > /dev/null 2>&1; then
      set +u
      msg "Scooping files from ${XDG_DOWNLOAD_DIR}" 1>&2
      msg2 "${_srcfil}" 1>&2
      set -u
      ln -sr "${XDG_DOWNLOAD_DIR}/${_srcfil}"
    fi
  fi
fi
unset _srcfil
unset XDG_DOWNLOAD_DIR
fi

md5sums=('7ffc2736e1c113956d6e5e6795b555dc'
         '8a66f50efdc867ffd6a27168bc93b210'
         '1cbde70639abd98db4bace284dbf2bc4'
         'f0b39865361437f3778ecbe6ffbc0a06'
         '89704501aff8efe859c31968d8d168e6'
         '46d719bf4872333ad6d138b050f1ad2d')
sha256sums=('f909ca3041613e777cbd67a58808e63b5ad6bf6cfa4f9c5ee712fc878634dc1d'
            '65282603bd0804d162f3f7da47bc7f3c91373e87504297d6a6fd6f2f8a1ec4ee'
            '8f865b52946a9ab98556c56306c7e70ae7aa432b4d005c70df0bba9d2c3111b1'
            '144e6651fcea08d95f3148d3a8ad17deb93fec4dd9236d37d27d7c648230b870'
            '635433e9c78ff58af65c316232ac9907d289a324428923788ea0f82ae7f8083b'
            '4c9d5ab69494b3d0d8b166fd5552aa7d587f44f804cec9e2990842ebcd1c8e1d')

#PKGEXT='.pkg.tar.zst' # gz is much faster than .xz, zst is much faster than gz
## Alternative mirror, if your local one is throttled:
## Posting new sites does no good. They get taken down by the admin
## from too much traffic or complaints from Oracle.
#source[0]=???

DLAGENTS=("${DLAGENTS[@]// -gqb \"\"/ -gq}")
DLAGENTS=("${DLAGENTS[@]//curl -/curl -b 'oraclelicense=a' -}")

# https://bugs.openjdk.java.net/browse/JDK-8170157
# 2020-06-19 jce_policy-8.zip/UnlimitedJCEPolicyJDK8/README.txt
if [ "${_minor}" -lt 161 ]; then
  source+=("https://download.oracle.com/otn-pub/java/jce/${_major}/jce_policy-${_major}.zip")
  _opt_JCE=1
else
  _opt_JCE=0
fi

if ! :; then
  for _d in "${!DLAGENTS[@]}"; do
    case "${DLAGENTS[${_d}]}" in
    'https::'*) DLAGENTS["${_d}"]='https::/usr/bin/wget --no-cookies --header Cookie:oraclelicense=a --no-glob --no-config --continue --tries=3 --waitretry=3 -O %o %u';;
    esac
  done
  makedepends+=('wget')
fi

package() {
  set -u
  cd "${_pkgname}1.${_major}.0_${_minor}"

  set +u; msg2 'Creating directory structure...'; set -u
  install -d "${pkgdir}/etc/.java/.systemPrefs"
  install -d "${pkgdir}/usr/lib/jvm/java-${_major}-${_pkgname}/bin"
  install -d "${pkgdir}/usr/lib/mozilla/plugins"
  install -d "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}"

  set +u; msg2 'Removing redundancies...'; set -u
  pushd 'jre' > /dev/null
  rm -r 'lib/desktop/icons/HighContrast/'
  rm -r 'lib/desktop/icons/HighContrastInverse/'
  rm -r 'lib/desktop/icons/LowContrast/'
  rm    lib/fontconfig.*.bfc
  rm    lib/fontconfig.*.properties.src
  rm    *.txt
  rm    'COPYRIGHT'
  rm    'LICENSE'
  rm    'README'
  rm -r 'plugin/'
  popd > /dev/null
  rm    'man/ja'

  set +u; msg2 'Moving contents...'; set -u
  mv * "${pkgdir}/${_jvmdir}"

  # Cd to the new playground
  cd "${pkgdir}/${_jvmdir}"

  set +u; msg2 'Fixing directory structure...'; set -u
  # Replace duplicate binaries in bin/ with links to jre/bin/
  local _i
  for _i in jre/bin/*; do
    ln -sf "${_jvmdir}/jre/bin/${_i##*/}" "bin/${_i##*/}"
  done

  # Suffix .desktops + icons (sun-java.png -> sun-java-${_jname}.png)
  local _i
  for _i in $(find 'jre/lib/desktop/' -type 'f'); do
    rename -- '.' "-${_jname}." "${_i}"
  done

  # Fix .desktop paths
  sed -e "s|Exec=|Exec=${_jvmdir}/jre/bin/|" \
      -e "s|.png|-${_jname}.png|" \
    -i 'jre/lib/desktop/applications'/*

  # Move .desktops + icons to /usr/share
  mv 'jre/lib/desktop'/* "${pkgdir}/usr/share/"
  install -m644 "${srcdir}"/*.desktop -t "${pkgdir}/usr/share/applications/"

  # Enable context menu launch (Austcool)
  sed -e 's:^NoDisplay=true:#&:g' \
      -e 's:^Exec=/usr.*$:& -F:g' \
    -i "${pkgdir}/usr/share/applications/sun-java-jdk8.desktop"

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-${_jname}/jre/lib -> /etc
  local _new_etc_path
  for _new_etc_path in "${backup[@]}"; do
    # Old location
    local _old_usr_path="jre/lib/${_new_etc_path#*${_jname}/}"

    # Move
    install -Dm644 "${_old_usr_path}" "${pkgdir}/${_new_etc_path}"
    ln -sf "/${_new_etc_path}" "${_old_usr_path}"
  done

  # Link NPAPI plugin
  ln -s "${_jvmdir}/jre/lib/amd64/libnpjp2.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpjp2-${_jname}.so"

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf '/etc/ssl/certs/java/cacerts' 'jre/lib/security/cacerts'

  # Suffix man pages
  for _i in $(find 'man/' -type 'f'); do
    rename -- '.1' "-${_jname}.1" "${_i}"
  done

  # Move man pages
  mv 'man/ja_JP.UTF-8/' 'man/ja'
  mv 'man/' "${pkgdir}/usr/share"

  # Move/link licenses
  mv 'COPYRIGHT' 'LICENSE' *.txt "${pkgdir}/usr/share/licenses/java${_major}-${_pkgname}/"
  ln -s "/usr/share/licenses/java${_major}-${_pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}"

if [ "${_opt_JCE}" -ne 0 ]; then
  set +u; msg2 'Installing Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files...'; set -u
  # Replace default "strong", but limited, cryptography to get an "unlimited strength" one for
  # things like 256-bit AES. Enabled by default in OpenJDK:
  # - http://suhothayan.blogspot.com/2012/05/how-to-install-java-cryptography.html
  # - http://www.eyrie.org/~eagle/notes/debian/jce-policy.html
  install -m644 "${srcdir}/UnlimitedJCEPolicyJDK${_major}"/*.jar 'jre/lib/security/'
  install -Dm644 "${srcdir}/UnlimitedJCEPolicyJDK${_major}/README.txt" \
                 "${pkgdir}/usr/share/doc/${_pkgname}/README_-_Java_JCE_Unlimited_Strength.txt"
fi

  set +u; msg2 'Enabling copy+paste in unsigned applets...'; set -u
  # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
  # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
  # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
  local _text='\
         // (AUR) Allow unsigned applets to read system clipboard, see:
         // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
         // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
         permission java.awt.AWTPermission "accessClipboard";'
  local _lf=$'\n'
  _text="${_text//${_lf}/\\n}"
  local _line
  _line="$(awk '/permission/{a=NR}; END{print a}' "${pkgdir}/etc/java-${_jname}/security/java.policy")"
  sed -e "${_line} a ${_text}" -i "${pkgdir}/etc/java-${_jname}/security/java.policy"
  set +u
}
set +u
