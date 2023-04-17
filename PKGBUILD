# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>
# Contributor: Jonas Heinrich <onny @t project-insanity dot org>
# Contributor: Evgeniy Alekseev <arcanis @t archlinux dot org>

pkgname=python-gspread-git
_pkgname=gspread
pkgver=v5.8.1.r0.g50b910f
pkgrel=1
epoch=
pkgdesc="Google Sheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=("MIT")
groups=()
depends=('python-requests' 'python-google-auth-oauthlib')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=()
optdepends=()
provides=('python-gspread')
conflicts=('python-gspread')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/burnash/gspread.git")
noextract=()
validpgpkeys=()
b2sums=('SKIP')

pkgver() {
   cd "gspread"
   git describe --long --tag | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python3 -m build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python3 -m installer --destdir="${pkgdir}/" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
