# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note upstream test suite is known to be broken (non-deterministic), even the
# upstream CI has an error code hack as seen here in check() to not flunk on
# tests that fail due to differing output across library versions. Given this,
# disabling the test by default for this build seems reasonable until they have
# a deterministic check function.
BUILDENV+=('!check')

_pipname=pancritic
pkgname=python-$_pipname
pkgver=0.3.2
pkgrel=2
pkgdesc='CriticMarkdup parser with optional pandoc backend'
arch=(any)
url="https://github.com/ickc/$_pipname"
license=(GPL3)
depends=(python)
makedepends=(pandoc
             python-setuptools
             texlive-core
             texlive-latexextra)
optdepends=('python-markdown: Markdown backend for Markdown output'
            'python-markdown2: Markdown2 backend for Markdown output'
            'python-panflute: Panflute backend for Markdown output'
            'python-pypandoc: Pandoc backend for Markdown output')
checkdepends=(python-coverage
              python-markdown
              python-markdown2
              python-panflute
              python-pypandoc)
source=("$_pipname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('670c0093924c11bb05a42ace4250166e076ad00f41e4208972613c07e3573515')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

check() {
	cd "$_pipname-$pkgver"
	make test ERRORCODE=0
}

package() {
	cd "$_pipname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
