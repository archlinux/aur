# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=doi2bib3
pkgver=0.2.0
pkgrel=1
pkgdesc="Fetch BibTeX for DOIs or resolve arXiv ids to DOIs and fetch BibTeX"
arch=('any')
url="https://github.com/archisman-panigrahi/doi2bib3"
license=('GPL')
depends=('python' 'python-requests' 'python-bibtexparser')
makedepends=('python-pip' 'python-packaging' 'python-build' 'git')
source=("https://github.com/archisman-panigrahi/doi2bib3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61b4d077d46f39ae99fd67c60455c847fded24c168300ca62dcc4e999d229f45')

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

