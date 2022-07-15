# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.5.0
pkgrel=2
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('any')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'python-pyqt5-webengine' 'python-ruamel-yaml' 'python-pyinotify' 'python-xlib' 'qt5-webengine' 'gobject-introspection' 'libxcb' 'libx11')
makedepends=('rsync' 'zip' 'make' 'gcc' 'typescript')
source=("$pkgname-$pkgver::git+$url.git#tag=${pkgver}" "package.patch")
sha512sums=('SKIP'
            '8146f3e6047fff6ebd24cd6a2fda91322e75bef24d54cad5112e4f0daffc4f0713505f062dfb9c24255de0c2a08856f3224fe57a668247941eba73f434cad0d6')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/package.patch"
    git submodule set-url ts-types https://github.com/JezerM/nody-greeter-types
    git submodule init
    git submodule update --recursive
}

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
