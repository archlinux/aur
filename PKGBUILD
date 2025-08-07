# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname='python-frontmatter'
pkgver=1.1.0
pkgrel=2
pkgdesc="Parse and manage posts with YAML (or other) frontmatter"
arch=('any')
url="https://pypi.org/project/python-frontmatter/"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f0d26bc7456a2ad868a6b5e5df2d6ee4')
depends=('python-toml' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  python -m build --wheel --no-isolation
}

check(){
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  pytest
}

package() {
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
