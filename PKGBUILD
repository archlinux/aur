# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=ipware
pkgname=python-ipware
pkgver=0.9.0
pkgrel=1
pkgdesc="Returns the best matched IP address from a given HTTP(s) header in Python"
arch=('any')
url="https://github.com/un33k/python-ipware"
license=('MIT')
makedepends=('python-setuptools')
conflicts=('python-django-ipware')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/un33k/python-ipware/archive/v$pkgver.tar.gz")
sha256sums=('527c2b813688628d0dde2e35eddaf02994fc879dde9b38e76662ca16ebe6413e')

build() {
  cd "$pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
