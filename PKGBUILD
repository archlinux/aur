# Maintainer: Christopher Arndt <chris at chrisarndt.de>

pkgname=ffind
pkgver=1.5.0
pkgrel=1
pkgdesc='A sane replacement for command line file search'
url='https://github.com/jaimebuelta/ffind'
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
conflicts=(friendly-find)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5d84b7d0083d53c0f9f5fb6e71afc9d202e291139f7b32114c5b2217e4c9a0f1')

prepare() {
  cd $pkgname-$pkgver
  # fix setuptools warning
  sed -i -e 's/description-file/description_file/' setup.cfg
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # license
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  install -Dm644 man_pages/ffind.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
