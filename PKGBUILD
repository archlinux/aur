# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

_opt_sig=0 # 1 to check sigs and check()
_opt_alt=1 # 1 to install as alternate version (bash4), 0 to replace bash

set -u
_pkgname='bash'
_basever='4.4'
_patchlevel='023'
pkgname="${_pkgname}${_basever%.*}"
pkgver="${_basever}.${_patchlevel}"
pkgrel='1'
pkgdesc='The GNU Bourne Again shell'
arch=('x86_64')
url='http://www.gnu.org/software/bash/bash.html'
license=('GPL')
#groups=('base')
depends=('glibc' 'ncurses')
optdepends=('bash-completion: for tab completion')
#_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
_archlink="@@@::https://git.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
_srcdir="${_pkgname}-${_basever}"
_verwatch=("https://ftp.gnu.org/gnu/bash/bash-${_basever}-patches/" '.*<a href="bash-\(4\.4\.[0-9]\{3\}\)".*' 'f'); _getlinks() { sed -e 's:-\([0-9]\):.\1:g' -e 's:bash44:bash-4.4:g'; }
source=("https://ftp.gnu.org/gnu/bash/bash-${_basever}.tar.gz")
if [ "${_opt_sig}" -ne 0 ]; then
  source+=("${source[0]}.sig")
fi
if [ "${_opt_alt}" -ne 0 ]; then
  provides=("${pkgname}=${pkgver}")
  depends+=('bash' 'readline>=8.0')
else
  backup=(etc/bash.bash{rc,_logout} etc/skel/.bash{rc,_profile,_logout})
  provides=("${_pkgname}=${pkgver}" 'sh')
  conflicts=("${_pkgname}")
  source+=(
    "${_archlink//@@@/dot.bashrc}"
    "${_archlink//@@@/dot.bash_profile}"
    "${_archlink//@@@/dot.bash_logout}"
    "${_archlink//@@@/system.bashrc}"
    "${_archlink//@@@/system.bash_logout}"
  )
fi
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey gpg --recv-keys

_patches=()
if [ "$((10#${_patchlevel}))" -gt 0 ]; then
  for (( _p=1; _p<="$((10#${_patchlevel}))"; _p++ )); do
    _f="bash${_basever//.}-$(printf '%03d' $_p)"
    _patches+=("${_f}")
    _f="https://ftp.gnu.org/gnu/bash/bash-${_basever}-patches/${_f}"
    source+=("${_f}")
    if [ "${_opt_sig}" -ne 0 ]; then
      source+=("${_f}.sig")
    fi
  done
fi
unset _p _f

md5sums=('148888a7c95ac23705559b6f477dfe25'
         '817d01a6c0af6f79308a8b7b649e53d8'
         '765e14cff12c7284009772e8e24f2fe0'
         '49e7da93bf07f510a2eb6bb43ac3e5a2'
         '4557d674ab5831a5fa98052ab19edaf4'
         'cce96dd77cdd1d293beec10848f6cbb5'
         'd3379f8d8abce5c6ee338f931ad008d5'
         'ec38c76ca439ca7f9c178e9baede84fc'
         'e0ba18c1e3b94f905da9b5bf9d38b58b'
         'e952d4f44e612048930c559d90eb99bb'
         '57b5b35955d68f9a09dbef6b86d2c782'
         'cc896e1fa696b93ded568e557e2392d5'
         'fa47fbfa56fb7e9e5367f19a9df5fc9e'
         '5e6a20166efe166267972cc78025417b'
         '00a8877a8787dbd78d97767db1115b0a'
         '2409586fd19e3104197ead86ce549eca'
         '4b31183db086daf8be8943d7f7ea7526'
         'c15c8844f1eb87bdbcde71417c9bd342'
         'b25e3373fc8de00523116dfe151ac4e0'
         '8f43e1d277b02f3319a34c1cd4a4ff3e'
         '5217ff08c444446ec306dce60437c288'
         '282c7d9b38da8005d25b4f816328a2f4'
         '0b709c9d7f8e6cf267a8b863efb899f7'
         'fe2e0ca4cf9409ff0e9428e1236f983e')
sha256sums=('d86b3392c1202e8ff5a423b302e6284db7f8f435ea9f39b5b1b20fd3ac36dfcb'
            '3e28d91531752df9a8cb167ad07cc542abaf944de9353fe8c6a535c9f1f17f0f'
            '7020a0183e17a7233e665b979c78c184ea369cfaf3e8b4b11f5547ecb7c13c53'
            '51df5a9192fdefe0ddca4bdf290932f74be03ffd0503a3d112e4199905e718b2'
            'ad080a30a4ac6c1273373617f29628cc320a35c8cd06913894794293dc52c8b3'
            '221e4b725b770ad0bb6924df3f8d04f89eeca4558f6e4c777dfa93e967090529'
            '6a8e2e2a6180d0f1ce39dcd651622fb6d2fd05db7c459f64ae42d667f1e344b8'
            'de1ccc07b7bfc9e25243ad854f3bbb5d3ebf9155b0477df16aaf00a7b0d5edaf'
            '86144700465933636d7b945e89b77df95d3620034725be161ca0ca5a42e239ba'
            '0b6bdd1a18a0d20e330cc3bc71e048864e4a13652e29dc0ebf3918bea729343c'
            '8465c6f2c56afe559402265b39d9e94368954930f9aa7f3dfa6d36dd66868e06'
            'dd56426ef7d7295e1107c0b3d06c192eb9298f4023c202ca2ba6266c613d170d'
            'fac271d2bf6372c9903e3b353cb9eda044d7fe36b5aab52f21f3f21cd6a2063e'
            '1b25efacbc1c4683b886d065b7a089a3601964555bcbf11f3a58989d38e853b6'
            'a7f75cedb43c5845ab1c60afade22dcb5e5dc12dd98c0f5a3abcfb9f309bb17c'
            'd37602ecbeb62d5a22c8167ea1e621fcdbaaa79925890a973a45c810dd01c326'
            '501f91cc89fadced16c73aa8858796651473602c722bb29f86a8ba588d0ff1b1'
            '773f90b98768d4662a22470ea8eec5fdd8e3439f370f94638872aaf884bcd270'
            '5bc494b42f719a8b0d844b7bd9ad50ebaae560e97f67c833c9e7e9d53981a8cc'
            '27170d6edfe8819835407fdc08b401d2e161b1400fe9d0c5317a51104c89c11e'
            '1840e2cbf26ba822913662f74037594ed562361485390c52813b38156c99522c'
            'bd8f59054a763ec1c64179ad5cb607f558708a317c2bdb22b814e3da456374c1'
            '45331f0936e36ab91bfe44b936e33ed8a1b1848fa896e8a1d0f2ef74f297cb79'
            '4fec236f3fbd3d0c47b893fdfa9122142a474f6ef66c20ffb6c0f4864dd591b6')

prepare() {
  set -u
  cd "${_srcdir}"

  local _p
  for _p in "${_patches[@]}"; do
    set +u; msg2 "applying patch ${_p}"; set -u
    patch -Ncp0 -i "${srcdir}/${_p}"
  done
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  if [ ! -s 'Makefile' ]; then
    local _bashconfig=(
      -DDEFAULT_PATH_VALUE="'\"/usr/local/sbin:/usr/local/bin:/usr/bin\"'"
      -DSTANDARD_UTILS_PATH="'\"/usr/bin\"'"
      -DSYS_BASHRC="'\"/etc/bash.bashrc\"'"
      -DSYS_BASH_LOGOUT="'\"/etc/bash.bash_logout\"'"
      -DNON_INTERACTIVE_LOGIN_SHELLS
    )
    local _cfg=(
      --prefix='/usr'
      --with-curses
      --enable-readline
      --without-bash-malloc
    )
    if [ "${_opt_alt}" -ne 0 ]; then
      _cfg+=(--with-installed-readline) # alternate shell: readline breakage is fixed by a recompile running from primary shell
    else
      _cfg+=(--without-installed-readline) # primary shell: prevent breakage because we can't update at the same time readline does
    fi
    set -x
    CFLAGS="${CFLAGS} ${_bashconfig[@]}" \
    ./configure "${_cfg[@]}"
    set +x
    unset _cfg _bashconfig
  fi
  local _mflags=()
  if [ -z "${MAKEFLAGS:=}" ] || [ "${MAKEFLAGS//-j/}" = "${MAKEFLAGS}" ]; then
    local _nproc="$(nproc)"
    if [ "${_nproc}" -gt 8 ]; then
      _nproc=8
    fi
    _mflags+=('-j' "${_nproc}")
  fi
  set -x
  make -s "${_mflags[@]}"
  set +x
  set +u
}

check() {
  set -u
  if [ "${_opt_sig}" -ne 0 ]; then
    make -j1 -C "${_srcdir}" check
  fi
  set +u
}

package() {
  set -u

  cd "${_srcdir}"
  if [ "${_opt_alt}" -ne 0 ]; then
    install -Dpm755 'bash' "${pkgdir}/usr/bin/${pkgname}"
    install -Dpm755 'doc/bash.1' "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  else
    make -s -j1 DESTDIR="${pkgdir}" install
    ln -s bash "${pkgdir}/usr/bin/sh"

    cd "${srcdir}"
    # system-wide configuration files
    install -Dpm644 'system.bashrc' "${pkgdir}/etc/bash.bashrc"
    install -Dpm644 'system.bash_logout' "${pkgdir}/etc/bash.bash_logout"

    # user configuration file skeletons
    install -Dpm644 'dot.bashrc' "${pkgdir}/etc/skel/.bashrc"
    install -Dpm644 'dot.bash_profile' "${pkgdir}/etc/skel/.bash_profile"
    install -Dpm644 'dot.bash_logout' "${pkgdir}/etc/skel/.bash_logout"
  fi
  set +u
}
set +u
