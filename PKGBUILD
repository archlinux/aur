# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fawkes-git
pkgver=r129.gaedaa82
pkgrel=1
pkgdesc="Image cloaking tool for personal privacy"
arch=('any')
url="https://sandlab.cs.uchicago.edu/fawkes/"
license=('BSD')
depends=('python' 'python-bleach' 'python-keras' 'python-mtcnn' 'python-numpy' 'python-pillow' 'python-scikit-image' 'python-tensorflow')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=('fawkes')
conflicts=('fawkes')
source=("git+https://github.com/Shawn-Shan/fawkes.git")
sha256sums=('SKIP')


pkgver() {
  cd "fawkes"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "fawkes"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "fawkes"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/fawkes"
}
