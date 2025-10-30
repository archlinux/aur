# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=doi2bib3
pkgver=0.3.0
pkgrel=1
pkgdesc="Fetch BibTeX for DOIs or resolve arXiv ids to DOIs and fetch BibTeX"
arch=('any')
url="https://github.com/archisman-panigrahi/doi2bib3"
license=('GPL')
depends=('python' 'python-requests' 'python-bibtexparser')
makedepends=('python-pip' 'python-packaging' 'python-build' 'git')
source=("https://github.com/archisman-panigrahi/doi2bib3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b7dfe0e2a3ebed9a26e29ed4b8e90de2b0b8f8595e00c4e01206b0f7465a3c0')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m build --wheel
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps dist/*.whl

  # install README under the real package name
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

