# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=3.5.1
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('any')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'python-gobject' 'python-pyqt5' 'python-pyqt5-webengine' 'python-ruamel-yaml' 'python-pyinotify' 'python-xlib' 'qt5-webengine' 'gobject-introspection' 'libxcb' 'libx11')
makedepends=('rsync' 'zip' 'make' 'gcc' 'typescript' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" "package.patch")
sha512sums=('73df3f231ab3ef8d55e0f90cecf19d9afcc53c96a85025bfca3ff97c610e90165686954507ebf81eb0110e3d5fd06d8accae7b7683fa2b15b1ed2a4e27c34282'
            '8146f3e6047fff6ebd24cd6a2fda91322e75bef24d54cad5112e4f0daffc4f0713505f062dfb9c24255de0c2a08856f3224fe57a668247941eba73f434cad0d6')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/package.patch"
    git init
    rm -rf themes/
    git submodule add https://github.com/JezerM/web-greeter-themes themes/
    git submodule update --init --recursive
}

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
