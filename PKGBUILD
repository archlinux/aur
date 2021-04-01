# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=inotifyrecursive
pkgname=python-inotifyrecursive
pkgver=0.3.5
pkgrel=1
pkgdesc="Simple recursive inotify watches for Python"
arch=('any')
url="https://github.com/letorbi/inotifyrecursive"
license=('LGPL3')
depends=('python-inotify-simple')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/letorbi/inotifyrecursive/archive/$pkgver.tar.gz")
sha512sums=('8432c817ace0c08481faba1cdec87e68b197a75312bbe9d4f6a0bfaf7ea058e6ee2686d01cdaeb75dfcf177cdace8a05df175e2d1afb0fe0899b603b6e1d8312')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
