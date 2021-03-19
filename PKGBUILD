# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='gtimelog'
pkgname=gtimelog-collabora-git
pkgver=r449.3254e91
pkgrel=2
pkgdesc="A time tracking application: Collabora repository."
provides=('gtimelog')
arch=('any')
url="https://gitlab.collabora.com/collabora/gtimelog.git"
license=('GPL2')
depends=(
  'libsoup'
  'python'
  'python-gobject')
makedepends=('git' 'python-setuptools')
source=(
  "$_pkgbase::git+https://gitlab.collabora.com/collabora/gtimelog.git"
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python setup.py install --root="$pkgdir/"

  # Install .desktop file and icon
  install -Dm644 "$_pkgbase.desktop" "${pkgdir}/usr/share/applications/$_pkgbase.desktop"
  install -Dm644 "src/$_pkgbase/$_pkgbase.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/$_pkgbase.png"
}

sha256sums=('SKIP')
