# Maintainer: Benoît Giraudou <bgiraudou @ gmail.com>
relpkgname=libndi3
pkgname=${relpkgname}-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="NDI library for OBS Studio"
arch=('x86_64')
license=('LGPL2.1')
url="https://github.com/Palakis/obs-ndi"
depends=('obs-studio')
provides=('libndi3')
conflicts=('libndi3')

_obsndiver=4.1.3

source=("${url}/releases/download/${_obsndiver}/${relpkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('c926bd193e604d85d50ee2a00a7c69c853920d7625057a36701d6384c639051c')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"

	cd "${pkgdir}"
	rm -rf root/

	cd "usr/lib"
	rm -rf libndi.so{,.3}
	ln -sf libndi.so.${pkgver} libndi.so.3
	ln -sf libndi.so.${pkgver} libndi.so
}
