# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qreator
pkgver=16.06.1
pkgrel=1
pkgdesc="Create your own QR codes"
arch=('any')
url="http://davidplanella.org/project-showcase/qreator/"
license=('GPL')
depends=('geoclue2' 'libchamplain' 'libnm-glib' 'python2-pillow' 'python2-cairo'
         'python2-dbus' 'python2-gobject' 'python2-qrencode' 'python2-requests'
         'python2-vobject' 'python2-xdg')
makedepends=('python2-distutils-extra')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_${pkgver}.tar.gz"{,.asc}
        "Port-to-geoclue-2.0.patch"
        "pil.patch")
validpgpkeys=('AA9019D554FC8466A675F46EBAE23342DCA278EF') # David Planella
sha256sums=('3e3608e48da6a3c88330c07766fb3f5ddcf32d2326524086e2fe7b44af117962'
            'SKIP'
            '5e6c76315c62aa8731bb2241f6d8849e06be63e4022e661c6854d473b0fb8d61'
            '11223fc0e9767f2d6d62ab05a2f865d15691c8c9356003e2d78293b77a844c6e')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../Port-to-geoclue-2.0.patch
	patch -Np1 -i ../pil.patch
}

build() {
	cd $pkgname-$pkgver
	python2 setup.py build
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root "$pkgdir" --optimize=1
}
