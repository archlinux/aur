# Maintainer: sasvari
# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>
pkgname=pubs
pkgver=0.9.0
pkgrel=3
pkgdesc="Your bibliography on the command line"
arch=(any)
url="https://github.com/pubs/pubs"
license=('LGPL-3.0')
depends=("python" "python-configobj" "python-bibtexparser" "python-beautifulsoup4" "python-yaml" "python-feedparser" "python-dateutil" "python-requests")
makedepends=("git" "python-setuptools" "python-build" "python-installer" "python-wheel")
provides=("pubs")
source=("https://github.com/pubs/pubs/archive/v$pkgver.tar.gz"
        "replace-pipes-with-shlex.patch")
sha256sums=('754a6033510f145702eeab4e99d71ed024f9e73245e2a71821692a9a32075b2b'
            '09ab0e2b9ef49591e52ec51c3207f1c5dc92c7d5f66823b4f09c07f5ff2c8924')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < "$srcdir/replace-pipes-with-shlex.patch"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
