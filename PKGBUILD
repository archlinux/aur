# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>
# Contributor: Jonas Heinrich <onny @t project-insanity dot org>
# Contributor: Evgeniy Alekseev <arcanis @t archlinux dot org>

pkgname=python-gspread-git
_pkgname=gspread
pkgver=v5.1.1.r0.g6ba0cde
pkgrel=1
epoch=
pkgdesc="Google Sheets Python API"
arch=('any')
url="https://github.com/burnash/gspread"
license=("MIT")
groups=()
depends=('python-requests' 'python-google-auth-oauthlib')
makedepends=()
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
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
