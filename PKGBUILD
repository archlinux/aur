# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=not1mm-9m2pju-git
pkgver=r123.abcdef0  # placeholder; will be auto-generated
pkgrel=1
pkgdesc="Unofficial git build of not1mm - Notion-style TUI Markdown Editor"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('MIT')
depends=('python' 'python-rich' 'python-appdirs' 'python-notctyparser' 'python-appdata')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('not1mm')
conflicts=('not1mm')
install=not1mm-9m2pju-git.install
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
