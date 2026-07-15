# Maintainer: Animesh Mishra <animesh.mishra818@gmail.com>
pkgname=cram-srs-git
_pkgname=cram
pkgver=r1.0.0
pkgrel=1
pkgdesc="Spaced repetition TUI for programming problems and academic concepts, powered by FSRS-4.5"
arch=('any')
url="https://github.com/animishraa05/cram"
license=('MIT')
depends=('python' 'python-textual')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('cram')
conflicts=('cram')
source=("git+https://github.com/animishraa05/cram.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
