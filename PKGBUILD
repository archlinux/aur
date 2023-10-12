# Maintainer: Sadie Blacklock <zulc22db+oss@gmail.com>
pkgname=mame-dl-git
pkgver=r4.542436b
pkgrel=1
epoch=1
pkgdesc="CLI ROM manager for MAME."
arch=('any')
url="https://github.com/zulc22/mame-dl"
license=('custom:0BSD')
depends=('python-requests' 'python-bs4' 'wget')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname::git+https://github.com/zulc22/mame-dl.git")
sha256sums=("SKIP")
conflicts=("mame-dl")
provides=("mame-dl")

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/$pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
