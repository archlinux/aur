# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: NebulaNeko <chfsefefgesfen foxmail>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=websockify-git
_pkgname=websockify
pkgver=v0.9.0.r52.geca301c
pkgrel=1
pkgdesc="WebSockets support for any application/server"
license=('LGPL3')
arch=('any')
url="https://github.com/novnc/websockify"
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(python-setuptools)
depends=(python)
optdepends=('python-numpy: for better HyBi protocol performance')
source=('git+https://github.com/novnc/websockify.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_pkgname"
  sed -i '/numpy/d' setup.py
}

build() {
  cd "$_pkgname"

  python setup.py build
}

package() {
  cd "$_pkgname"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
