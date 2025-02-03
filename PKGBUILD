# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>

## links
# https://pypi.org/project/cups-of-caffeine

_name="cups-of-caffeine"
_pkgname="caffeine"
pkgname="$_pkgname"
pkgver=2.9.14
pkgrel=1
pkgdesc="Keep your computer awake"
url="https://launchpad.net/caffeine"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
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
sha256sums=('d8b6f6d54d66758158189a633bd43e384e425edfb0dcb9c72a775bade4ea7541')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
