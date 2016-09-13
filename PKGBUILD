# Maintainer: Donald Carr <sirspudd at gmail dot com>

#set -x

if [[ -z $_piver ]] && [[ -n $LOCAL_PI_VER ]]; then
  _piver=$LOCAL_PI_VER
fi

if [[ -z $_piver ]]; then
  echo "You have to specify a Raspberry Pi version before continuing"
  exit 1
fi

if [[ -n "$_piver" ]]; then
  _qmake="/opt/qt-sdk-raspberry-pi${_piver}/bin/qmake"
fi

_pkgname=qpi

case $_piver in
1)
  _toolchainname=armv6-rpi-linux-gnueabihf
;;
2)
  _toolchainname=armv7-rpi2-linux-gnueabihf
;;
3)
  _toolchainname=aarch64-rpi3-linux-gnueabi
;;
esac

pkgname=qpi${_piver}-toolchain
pkgver=6.1.0
pkgrel=4
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
