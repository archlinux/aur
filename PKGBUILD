# Maintainer: 0WN463 <0WN3D.e4d568 at burnermail dot io> 
# Contributor: 

pkgname=bobcat-git
pkgver=r67.fdcb96a
pkgrel=1
pkgdesc="CLI script to browse and solve problems on Kattis, the online judge"
arch=('any')
url="https://github.com/0WN463/bobcat"
license=('MIT')
depends=('python' 'python-requests' 'python-lxml' 'python-beautifulsoup4')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-unicodeit: LaTeX to unicode conversion')
source=("git+$url")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/bobcat" clean -dfx
}

build() {
  cd "${srcdir}/bobcat"
  python -m build --wheel --no-isolation
}

pkgver() {
  cd "${srcdir}/bobcat"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/bobcat"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

