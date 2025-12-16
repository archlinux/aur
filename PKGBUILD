# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=python-doi2bib3
_pkgname=doi2bib3
pkgver=0.5.2
pkgrel=1
pkgdesc="Fetch BibTeX for DOIs or resolve arXiv ids to DOIs and fetch BibTeX"
arch=('any')
provides=('doi2bib3')
conflicts=('doi2bib3')
url="https://github.com/archisman-panigrahi/doi2bib3"
license=('GPL')
depends=('python' 'python-requests' 'python-bibtexparser')
makedepends=('python-pip' 'python-packaging' 'python-build' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${_pkgname}"
}

build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel
}

package() {
  cd "$srcdir/${_pkgname}"
  # Install wheel into the package root. --ignore-installed prevents pip
  # from attempting to uninstall an existing system-installed package.
  python -m pip install --root="$pkgdir" --prefix=/usr --no-deps --ignore-installed dist/*.whl

  # install README under the real package name
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

