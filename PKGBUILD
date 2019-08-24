# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mirage
pkgver=1.0_pre2
pkgrel=2
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=('GPL')
depends=('pygtk' 'libexif')
optdepends=('gnome-python: toolbar setting support in GNOME')
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2
        exif.patch
        exif.c)
md5sums=('3a0cdb4efd445f85bc29a1ab7ff8a579'
         '1eed664ef628970a7dd16c4d471c6a24'
         '16285505d2dea76e2ab3e9159fafd8ce')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/exif.patch"
  cp "${srcdir}/exif.c" .
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
