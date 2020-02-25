# Maintainer: Michał Pałubicki <maln0ir@gmx.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=csvkit
pkgver=1.0.4
pkgrel=3
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=("any")
url="http://csvkit.readthedocs.org"
license=("MIT")
depends=(
    'python'
    'python-agate>=1.6.1'
    'python-agate-dbf>=0.2.0'
    'python-agate-excel>=0.2.2'
    'python-agate-sql>=0.5.3'
    'python-babel'
    'python-dateutil'
    'python-openpyxl'
    'python-six>=1.6.1'
    'python-sqlalchemy'
    'python-xlrd'
    'python-sphinx_rtd_theme>=0.1.6'
  )
optdepends=(
    'ipython: nicer command-line for csvpy utility'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
  )
source=("https://github.com/wireservice/csvkit/archive/${pkgver}.tar.gz")
sha256sums=('e19c609894c42e850c25af1ca9082753f76f231450f70a70c46344bec45c1a66')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    python setup.py build_sphinx
    mkdir -p "$pkgdir/usr/share/doc"
    cp -rv "$srcdir/$pkgname-$pkgver/build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"

    _rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
    rm -rvf "$pkgdir/usr/share/doc/$pkgname/_static"
    ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "$pkgdir/usr/share/doc/$pkgname/_static"
}

# check() {
#     cd "$srcdir/$pkgname-$pkgver"
#     python setup.py test
# }

# vim:set ts=2 sw=2 et:
