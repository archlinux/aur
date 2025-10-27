# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>

_name="cups-of-caffeine"
_pkgname="caffeine"
pkgname="$_pkgname"
pkgver=2.10.0
pkgrel=1
pkgdesc="Keep your computer awake"
url="https://pypi.org/project/cups-of-caffeine"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'gtk3'
  'libayatana-appindicator'
  'python'
  'python-ewmh' # AUR
  'python-gobject'
  'python-xlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="${_name//-/_}-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/$_pkgsrc.$_pkgext")
sha256sums=('490b437abebd422edd6b0efa6fcd9eeaa3c50e84fd144e1df6a18012bca143f9')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
