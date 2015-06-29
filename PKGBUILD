# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gimp-lensfun
pkgver=0.2.3
pkgrel=4
pkgdesc="A Gimp plugin to correct lens distortion using the lensfun library and database."
arch=('i686' 'x86_64')
url="http://seebk.github.io/GIMP-Lensfun/"
license=('GPL')
depends=('gimp' 'lensfun' 'exiv2')
source=("https://github.com/seebk/GIMP-Lensfun/releases/download/${pkgver}/gimplensfun-${pkgver}.tar.gz")
sha256sums=('509cc8b7e3ed44232c7132409281acdbbfddf3e1cd76bbf0b1893751818a43d9')

build() {
	cd ${srcdir}/gimplensfun-${pkgver}

	sed -i '/CCI/s|^|//|' src/gimplensfun.cpp

	make
}

package() {
	cd ${srcdir}/gimplensfun-${pkgver}

	install -D -m0755 gimp-lensfun ${pkgdir}/usr/lib/gimp/2.0/plug-ins/gimp-lensfun

	install -D -m0644 CHANGES.txt ${pkgdir}/usr/share/doc/gimp-lensfun/CHANGES.txt
	install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/doc/gimp-lensfun/LICENSE.txt
	install -D -m0644 README.txt ${pkgdir}/usr/share/doc/gimp-lensfun/README.txt
}

