# Maintainer: Len Chan <lenchan139@tto.moe>
pkgname=brother-color-label-printer
pkgver=0.3
pkgbuild=4
pkgrel=4
pkgdesc="A Linux color labeling printing command tool for Brother VC-500W color label printer"
arch=('any')
url="https://gitlab.com/lenchan139/labelprinter-vc500w"
license=('AGPLv3')
groups=('office')
depends=('python3')
makedepends=()
optdepends=()
provides=('labelprinter')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/lenchan139/labelprinter-vc500w/-/archive/$pkgver/$provides-vc500w-$pkgver.tar.gz)

noextract=()
md5sums=('bbdcacb070866a4c34d888f3a4292275')

build() {
	echo "Nothing to build"
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${provides}-vc500w-$pkgver/${provides}" "${pkgdir}/opt/${pkgname}"
  touch  "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 echo -en '#!/bin/sh \n PYTHONPATH=/opt/brother-color-label-printer python3 -m labelprinter "$@"' >  "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 chmod a+rw "${pkgdir}/opt/${pkgname}/labelprinter.sh"
 chmod +x "${pkgdir}/opt/${pkgname}/labelprinter.sh"
  ln -s "/opt/${pkgname}/labelprinter.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/${pkgname}/labelprinter.sh" "${pkgdir}/usr/bin/bclprinter"
}
