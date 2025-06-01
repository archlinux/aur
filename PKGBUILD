# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

# TODO: package is not compatible with makepkg -Rfi

set -u
pkgname=inetutils
_pkgname="${pkgname}"
pkgname="${_pkgname}-git"
pkgver=2.6.r4.g9ab1f527
pkgrel=1
pkgdesc="A collection of common network programs"
arch=('x86_64')
url="https://www.gnu.org/software/inetutils/"
license=('GPL-3.0-or-later')
depends=('glibc' 'pam' 'libcap' 'readline' 'ncurses' 'libxcrypt'
	     libpam.so libcrypt.so libreadline.so libncursesw.so)
depends+=('bash')
makedepends=('help2man')
makedepends+=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
backup=('etc/pam.d/rlogin' 'etc/pam.d/rsh')
backup+=(
  'etc/xinetd.d'/{telnet,talk,rlogin,rsh}
  'etc/pam.d/telnetd'
)
options=('!emptydirs')
#options+=('!strip')
install=inetutils.install
#_verwatch=('http://ftp.gnu.org/gnu/inetutils/' 'inetutils-\([0-9\.]\+\)\.tar\.gz' 'l')
_srcdir="${_pkgname}"
source=(
  "git+https://git.savannah.gnu.org/git/${_pkgname}.git" #commit=3d64a8c7280e7d218c4b607aa25352be1d6c4ded"
  'git+https://git.savannah.gnu.org/git/gnulib'
  '0001-telnetd-Fix-buffer-overflows.patch'
  'telnetd.pam' # for now this overwrites /etc/pam.d/other until a better way or pam patch is found
) # This link must be the same as the one in bootstrap
_archlink="@@@::https://gitlab.archlinux.org/archlinux/packaging/packages/${_pkgname}/-/raw/main/@@@?ref_type=heads&inline=false"
_archsource=(
  'ftpd.service'
  'rlogin'{.pam,@.service,.socket,.xinetd}
  'rsh'{.pam,@.service,.socket,.xinetd}
  'talk'{.service,.socket,.xinetd}
  'telnet'{@.service,.socket,.xinetd}
  'inetutils.sysusers'
)
for _src in "${_archsource[@]}"; do
  if [[ "${_src}" = *.xinetd ]]; then
    source+=("${_src}")
  else
    source+=("${_archlink//@@@/${_src}}")
  fi
done
unset _src _archlink
md5sums=('SKIP'
         'SKIP'
         'a902f8c38f6db36574b928e41d2d2814'
         '6e6c8719e5989d976a14610f340bd33a'
         'fe181e22d3544456f52e64f3bdf5f291'
         'cda2aa3cd2353120b142fd33b3b4f4df'
         '7cea13f4ff7fd170fc4d03ef2698200d'
         'f4d16e649c13db9d47ad3654d1595c83'
         'bf522b381451b3fba8386f3566b37848'
         '8083b2fac54a76afb93be31d2f55dc68'
         'fc022f7959011aa2bf27d573bdcdc7dd'
         '71b8206f220d28b91aabaf9cb16038f1'
         '50c76143eadd3c004f5857d712fa05c4'
         '36cb58af924ea00051eb041e7192d5fd'
         'bd581fa64b91ded853317334b1489346'
         'ae4539ffbabae314744aea8467125f85'
         'd7e5d8f70b7fc7321ab0e61178829b06'
         'bafd84474b3a0942307571e742dd096f'
         'ab71e7458e8ed2b9d31c48eba5ab4c3a'
         '825b7eac0b44e6a1b0158a23aca005a2')
sha512sums=('SKIP'
            'SKIP'
            'bb37106b7ef6a585f7bbcf395c388f77b3cd43eaf2a6b1db1529bfa0578c4ef04a656eef4c203f0737c4c8943d7454f9a8debde56eb8157d1e5e82a82c23cff0'
            '51f35b2b736d8b601a6ea42c038ab0f498225ce4e392eeb35fdcec4a51a7a492a836de451a28565a27dea694a4a29ac4de7ea2c8852bba63cad58710641557fe'
            'df5b37c9fc072e012f0e67d849db7e535a62ddb17a37e865acb157f2bc16ffd72d84f24fef1e788dacbbe7e5675e87e141fbd36e53339cc7810dde1b9c54a3b8'
            '432a45af5cd4f9f2dee4b631b45745b734e47cf631553e79db31905fa0839988914bcfed1dfcdd00d2ea6e4029b0674d46623c33ce0bd0678c2628fbaa0d1b25'
            '5c2d1040484f4053cc6e114d38e3a671792c6f196f666a6f6529276d55589870fa9040ac32ac9b521c80c14931b03c97738d2a6ffb50d3a658363a5123ea9e6e'
            '8857dd03794a0ed48b87e6a876c4e17246f3bb4083dc2a9593d8c05d831b03d944d133ae8dc44bc23d1b9d7fe82dd7ab166cb87f53b859a62fc1479e9a49a1de'
            '7091c983bb6d96da3b471fa95d6fdda02cee5b42c4abb93048f7db0d313c17f6c11356cafa835ab4ad01401a30c2169288da2d6a1c4e661c93c36496c04cf507'
            'c957708315ea2d873da55691bb0d0997ee3e2dcb40fb47cef19fd60c25379f1660d0605edd8fb0a477252c5af3e422b44b5e0aaa5b76220dadc90791dd526801'
            'b71e7c25bb1fe3e35420ea3d7eda9b44ed61423ec54973a42a0b5bdac01e8d131aa9656a1e050d74f27723a976fe058a79a04bb34ed70dc5eeb7c49b9be078b4'
            '9fc711b8260f4340188b8f6bc5ac944958d1609a1a506d76b3be917a01caa4493edae89da3c1eaa55294bbddaa6744c68ecb1cd322bb2d74e284d2d6fcd0d2c8'
            '6f5f8b2e1ed24bccfdd08f37d2efca3750d632a5ff4188ed12a10b6cbfe84e85be996020704dfab7b427c023fcc3f328bbda23d69266eba98af0069dcb9de6ea'
            '0024798b019c8720a52d5003730085de4fb091826c50605d7eeb4506a2fe189740535106e6e8a7afc61edbbd2c5f689358a4009cd466f1a7dcb3a9e8a8c8425a'
            '502ca66fb2c0a2df0ea8827c820c199c29a91ab5ccff26866e02a4219007ee7fa36ed4b6001207212db332047a574edc70744e6fcc130d62aab02faa3c9566f7'
            'd440094014d13ca7c3afb4eef735d3526ed8de2cc2de98a48d9682bee9aa197ea750de916c90a6b9e9839529a30b98138fb52427d89e1ee541a87e3401d892b2'
            '6b1f170c1c680bfa2186e0cb3bf555124048c46669bee0265948d22723493b5a23a735f52a8a72304e6cd020dbf2c9991d6cbc4e006bf38dc3b7d6c1addcf1e8'
            '218f2b5686ca0321a9f7a5a991c69b289aa297b7a295e654020636d38fbb5a37d09e720c1e2f950ba14616b0e7dafc2cb6a5e325e3b117dfe0ab3c733b98e5eb'
            '7445417b3cde6dd5a8ad5568c1272ac0b9b4a2375735c707c0cff09ad98a2ba322e6921945b5b1efd0e86212db13eacb5606bd3fa841da9515df5d40f75ad4a2'
            '00a6ff36efe63612990181f7cb37ea7d43ee7f2b6bda6b1fc23ccb2f3b19da54aabad041c2412936561dcd997f9613bd8144a96f5e04f30135a36f9ac98d8056')
# GNU Keyring: https://ftp.gnu.org/gnu/gnu-keyring.gpg
validpgpkeys=(
  '4FBD67621082C4C502448E3B180551BAD95A3C35' # Alfred M. Szmidt <ams@gnu.org>
  '9AA9BDB11BB1B99A21285A330664A76954265E8C' # Simon Josefsson <simon@josefsson.org>
  'B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE' # simon@josefsson.org
)

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e "s:^${_pkgname}-::g" -e 's:_:.:g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  if [ ! -L 'gnulib' ]; then
    rmdir 'gnulib' || :
    ln -sf '../gnulib'
    # telnetd disconnects without banner on 90% of connections
    # http://lists.gnu.org/archive/html/bug-inetutils/2015-07/msg00006.html
    # http://lists.gnu.org/archive/html/bug-inetutils/2015-08/index.html
    #sed -e 's:if (pty_read () <= 0):if (pty_read () < 0):g' -i 'telnetd/telnetd.c'

    # http://lists.gnu.org/archive/html/bug-inetutils/2017-07/msg00005.html
    #patch -Nbup1 -i '../0001-telnetd-Fix-buffer-overflows.patch'
  fi

  # Disable wu-ftpd logging to wtmp. logging is worthless without anti-hammer.
  sed -e '/logwtmp_keep_open/ s:^:// :g' -i 'ftpd/ftpd.c'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    ./bootstrap
    # autoreconf -fiv
    CFLAGS="${CFLAGS} -g -rdynamic -DHAVE_TERMCAP_TGETENT" \
    CXXFLAGS="${CXXFLAGS} -g -rdynamic" \
  ./configure \
    --prefix=/usr \
    --libexec=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-wrap \
    --with-pam \
    --enable-ftp \
    --enable-ftpd \
    --enable-telnet \
    --enable-telnetd \
    --enable-talk \
    --enable-talkd \
    --enable-rlogin \
    --enable-rlogind \
    --enable-rsh \
    --enable-rshd \
    --enable-rcp \
    --enable-hostname \
    --enable-dnsdomainname \
    --disable-rexec \
    --disable-rexecd \
    --disable-tftp \
    --disable-tftpd \
    --disable-ping \
    --disable-ping6 \
    --disable-logger \
    --disable-syslogd \
    --disable-inetd \
    --disable-whois \
    --disable-uucpd \
    --disable-ifconfig \
    --disable-traceroute
    sed -e '/INSTALL_STRIP_PROGRAM/ s: -s::g' -i 'Makefile'
  fi
  nice \
  make
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  nice \
  make check
  set +u
}

_scriptdir="/usr/share/${pkgname}"
_script="${_scriptdir}/${pkgname}.sh"

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  chmod -s "${pkgdir}"/usr/bin/{rcp,rlogin,rsh}

  local _src
  for _src in "${_archsource[@]}"; do
    case "${_src}" in
    *.xinetd)           install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/xinetd.d/${_src%.xinetd}";;
    *.pam)              install -Dpm644 "${srcdir}/${_src}" "${pkgdir}/etc/pam.d/${_src%.pam}";;
    *.service|*.socket) install -Dpm644 "${srcdir}/${_src}" -t "${pkgdir}/usr/lib/systemd/system/";;
    *.sysusers) ;;
    *) echo "Don't know where to write ${_src}"; false;;
    esac
  done

  # Install readline update detector
  install -Dpm644 <(cat << EOF
#!/bin/sh

set +e
set -u

ftp << FEOF
quit
FEOF
if [ "\$?" -ne 0 ]; then
  echo '*******************************************************************************'
  echo '*******************************************************************************'
  echo 'readline has been updated. ${pkgname} must be recompiled soon***************'
  echo '*******************************************************************************'
  echo '*******************************************************************************'
fi
EOF
  ) "${pkgdir}${_script}"
  bash -n "${pkgdir}${_script}"

  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Check ${pkgname} on each upgrade of readline

[Trigger]
Operation = Upgrade
Type = Package
Target = readline

[Action]
Description = Check ${pkgname} for readline update
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/bash "${_script}"
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-readline.hook"

if ! :; then
  # Crude but effective method for fixing pam unaware application
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Update /etc/pam.d/other for ${pkgname} on each upgrade of pambase

[Trigger]
Operation = Upgrade
Type = Package
Target = pambase

[Action]
Description = Update /etc/pam.d/other for ${pkgname}
Depends = coreutils
When = PostTransaction
Exec = /usr/bin/cp -p /etc/pam.d/telnetd /etc/pam.d/other
EOF
  ) "${pkgdir}/usr/share/libalpm/hooks/${pkgname}-pambase-other.hook"
fi
  install -Dpm644 "${srcdir}/telnetd.pam" "${pkgdir}/etc/pam.d/telnetd"

  local pkgname="${_pkgname}"
  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  set +u
}
set +u
