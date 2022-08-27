# Maintainer: seth <getchoo at tuta dot io>

pkgname=hiccup-git
pkgver=r18.22378ab
pkgrel=1
pkgdesc="a python script to help keep you up to date"
arch=(any)
url="https://github.com/getchoo/hiccup"
license=('MIT')
depends=('python' 'xdg-user-dirs')
makedepends=('git' 'python-build' 'python-installer'
             'python-wheel' 'python-flit-core')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git#branch=main")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"

  python -m installer --compile-bytecode=1 --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# nvim: ts=2 sw=2 et:
