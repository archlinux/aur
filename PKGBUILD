# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-sql
pkgname=python-$_pkgname
pkgver=0.5.4
pkgrel=1
pkgdesc="Adds SQL read/write support to agate"
arch=('any')
url="http://agate-sql.readthedocs.org/"
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-sqlalchemy>=1.0.8'
    'python-sphinx_rtd_theme>=0.1.6'
  )
optdepends=(
    'python-crate-git'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
  )
source=("https://github.com/wireservice/agate-sql/archive/${pkgver}.tar.gz")
sha256sums=('15eed2f24972907213809033a5cb138e9299724a638229476e9bd791401c0461')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  python setup.py build_sphinx
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgname-$pkgver/build/sphinx/html" "$pkgdir/usr/share/doc/$_pkgname"

  _rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
  rm -rvf "$pkgdir/usr/share/doc/$_pkgname/_static"
  ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "$pkgdir/usr/share/doc/$_pkgname/_static"
}
