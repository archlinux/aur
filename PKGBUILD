# Maintainer: Fr4z49 <kekko.mar08@gmail.com>

pkgname=markit-git
pkgver=r32.e96f632
pkgrel=1
pkgdesc="Un formato simile a markdown progettato per creare pdf con degli stili predefiniti."
arch=('any')
url="https://github.com/Fr4z49/Mark-it"
license=('GPL3')

depends=('python' 'python-reportlab')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')

provides=('mark-it')
conflicts=('mark-it')

source=("git+${url}.git#branch=beta")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Mark-it"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Mark-it"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/Mark-it"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 Style.json \
    "$pkgdir/usr/share/mark-it/Style.json"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
