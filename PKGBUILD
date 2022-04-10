# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.4.1
pkgrel=2
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('x86_64')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'python-pyqt5-webengine' 'python-ruamel-yaml' 'python-pyinotify' 'python-xlib' 'qt5-webengine' 'gobject-introspection' 'libxcb' 'libx11')
makedepends=('rsync' 'zip' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" "package.patch")
sha512sums=('c0b03f924e5e2753aa9e729a5d2fa3bcea80b4894455359e6e9f35caacbee80714af30d77ea77f6d1f76c36fbed3d69c22ff9414f09c35ee8deedbf5b08b205a'
            '8146f3e6047fff6ebd24cd6a2fda91322e75bef24d54cad5112e4f0daffc4f0713505f062dfb9c24255de0c2a08856f3224fe57a668247941eba73f434cad0d6')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/package.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
