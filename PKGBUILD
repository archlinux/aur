# Maintainer: Alexandr Parkhomenko <it@52tour.ru>

_author=rdeits
_pkgname=meshcat-python
pkgname=python-meshcat-git
pkgver=0.0.18.r58.g69e18e2
pkgrel=1
pkgdesc='MeshCat is a remotely-controllable 3D viewer, built on top of three.js'
arch=(
  'any'
#  'x86_64'
)

url='https://github.com/'
license=('MIT')
depends=('python'
'python-umsgpack' #aur 0kb
)
makedepends=('git')
optdepends=('opengrok')
provides=('python-meshcat' 'meshcat-python' 'meshcat')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update --recursive
  git fetch --tags
}

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
#  python setup.py test # need grok
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
