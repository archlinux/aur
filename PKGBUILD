# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Zack <simonzack@gmail.com>
# Contributor: Toasty <toastyyogurttime@gmail.com>
# Contributor: Stephen304 <stephen304@gmail.com>

_name="cups-of-caffeine"
_pkgname="caffeine"
pkgname="$_pkgname"
pkgver=2.9.12
pkgrel=2
pkgdesc="Keep your computer awake"
url="https://launchpad.net/caffeine"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'python'
  'python-setuptools'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'libayatana-appindicator: caffeine-indicator (tray applet) support'
)

_pkgsrc="$_name-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.$_pkgext")
sha256sums=('84ee54e83e8007b4a455b5f3e61ce97c0332c064fe5b39abd29f821f9d438f83')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

check() {
  cd "$_pkgsrc"
  python setup.py check
}

package() {
  depends+=(
    'python-xlib'
    'python-gobject'

    ## AUR
    'python-ewmh'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
