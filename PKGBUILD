# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.4.1
pkgrel=4
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('any')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'python-pyqt5-webengine' 'python-ruamel-yaml' 'python-pyinotify' 'python-xlib' 'qt5-webengine' 'gobject-introspection' 'libxcb' 'libx11')
makedepends=('rsync' 'zip' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" "package.patch")
sha512sums=('fdfe60f777857e06e9691ffbd38e53256267fa42a6b152ff1d25e5406530bba8d86850f82637b6748a316964afc329e8f9c172bf1433b55b707e745875f65e4f'
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
