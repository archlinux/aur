# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>

_name="cups-of-caffeine"
_pkgname="caffeine"
pkgname="$_pkgname"
pkgver=2.10.1
pkgrel=1
pkgdesc="Keep your computer awake"
url="https://launchpad.net/caffeine"
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
sha256sums=('a933c61a206f61c92acd4e6513104f2e9411e76b728309657d5287f5df5cb527')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
