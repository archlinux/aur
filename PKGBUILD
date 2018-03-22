# Maintainer: Donald Carr <sirspudd at gmail dot com>

#set -x

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -z $_piver ]]; then
  echo "You have to specify a Raspberry Pi version before continuing"
  exit 1
fi

_pkgname=qpi

case $_piver in
1)
  _toolchainname=armv6-rpi-linux-gnueabihf
  pkgver=6.1.0
;;
2)
  _toolchainname=armv7-rpi2-linux-gnueabihf
  pkgver=6.1.0
;;
3)
  _toolchainname=aarch64-rpi3-linux-gnu
  pkgver=7.3.0
;;
esac

pkgname=qpi${_piver}-toolchain
pkgrel=5
pkgdesc="cross-tool-ng compiled GCC toolchain for the pi"
arch=("x86_64")
license=("GPL")
makedepends=("git")

_toolchainreponame=crosstool-ng-toolchains

url="https://github.com/sirspudd/${_toolchainreponame}"
source=("git+https://github.com/sirspudd/${_toolchainreponame}.git#tag=GCC-${pkgver}-${_toolchainname}")
sha256sums=("SKIP")
options=('!strip')

package() {
  local destdir="${pkgdir}/opt"
  mkdir -p "${destdir}"
  cp -r "${srcdir}/${_toolchainreponame}/${_toolchainname}" "${destdir}"
}
