# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.8.1
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl)
conflicts=(gourou gourou-git)
provides=("gourou=${pkgver}")
options=(!strip)
source=("https://indefero.soutade.fr/p/${__pkgname}/downloads/get/${__pkgname}_utils_${pkgver}.tgz")
sha512sums=(ee5e2ffd298fd38757f6a060fc2d697222d50834cdb0e19837fd036ce08eb5a1fa57cc201e11237e18b0b8f2714f7afb0e5d21ca97497aa48e6e90e551ffe4b3)

package() {
	cd "${srcdir}/${__pkgname}_utils_${pkgver}"

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove} "$pkgdir"/usr/bin
	# super ugly but it works!
	sed -i 's/libzip\.so\.4/libzip.so.5/' "$pkgdir"/usr/bin/*
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
