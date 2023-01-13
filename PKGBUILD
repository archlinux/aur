# Maintainer: Jack Chen <redchenjs@live.com>

_srcname=SNANDer
_version=1.7.6
_version_pkg_updates=1
_gitcommit=8cf7027ecba63c80ad6edabed6c07d32eae477b8

pkgname=snander
pkgver="${_version}+${_version_pkg_updates}+${_gitcommit::7}"
pkgrel=1
pkgdesc="SNANDer - Serial Nor/nAND/Eeprom programmeR (based on CH341A)"
url="https://github.com/McMCCRU/SNANDer"
arch=('any')
license=('GPL-2.0')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_srcname}/src"

  sed -i -r "s|^(SNANDer:).*$|\1 \$(OBJS)|g" Makefile

  cd libusb-*
	./configure --prefix="${srcdir}/${_srcname}/src/lusb_build" --disable-udev
	make && make install

  cd ../ && make 
}

package() {
  install -D -m755 "${srcdir}/${_srcname}/src/SNANDer" "${pkgdir}/usr/bin/SNANDer"
}
