# Maintainer: SvartaHjarta <qi0cez9jf@mozmail.com>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
pkgname=kattis-problemtools-git
pkgver=1.20231016.r351.gbabb11d
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('i686' 'arm' 'x86_64')
url="https://github.com/Kattis/problemtools"
license=('MIT')
groups=()
depends=('python' 'python-yaml' 'python-unidecode' 'python-colorlog' 'python-nh3' 'python-pydantic' 'pandoc' 'gmp' 'plastex-git' 'ghostscript' 'texlive-fontsrecommended' 'texlive-langcyrillic' 'texlive-latexextra' 'texlive-plaingeneric' 'tidy')
makedepends=('git' 'make' 'boost' 'python-setuptools')
checkdepends=('python-pytest')
provides=('problem2html'  'problem2pdf'  'verifyproblem')
conflicts=()
replaces=('kattis-problemtools')
backup=()
options=()
install=
source=('git+https://github.com/Kattis/problemtools')
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/problemtools
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/problemtools
    python3 setup.py build
}

check() {
  cd "$srcdir"/problemtools
  PYTHONPATH=./ pytest
}

package() {
    cd "$srcdir"/problemtools
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python3 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
