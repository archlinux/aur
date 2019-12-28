# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mirage
pkgver=1.0_pre2
pkgrel=4
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=('GPL')
depends=('pygtk' 'libexif')
optdepends=('gnome-python: toolbar setting support in GNOME')
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2
        exif.patch
        exif.c)
install=$pkgname.install
sha256sums=('6b5b0011f41daec3653c464e47fd225e52b741fcad8870960e0a94662a2fdda7'
            'a669be216365c84bc1f4dc3d08ee97ed0b0eee083c0293004a3f2772f9e177bd'
            'ed965fcf26cc1ca8ddea7eec8bc44a19d2c73e495235f9b015f9ee405ccce95f')

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
