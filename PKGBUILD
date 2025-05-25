# Maintainer: robertfoster

pkgname=gr-lida-git
pkgver=513.e8b9a39
pkgrel=1
pkgdesc="Frontend for DosBox, ScummVM and VDMSound"
arch=('i686' 'x86_64')
url="http://www.gr-lida.org/"
license=('GPL-2.0-only')
depends=(
  'phonon-qt5'
  'poppler-qt5'
  'qt5-base'
  'qt5-multimedia'
  'qt5-script'
)
optdepends=(
  'dosbox: Enable support for dosbox emulator'
  'scummvm: Enable support for scummvm emulator'
)
makedepends=('git')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+https://github.com/Monthy/${pkgname%%-git}.git")

build() {
  cd "${pkgname%%-git}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "${pkgname%%-git}"
  make INSTALL_ROOT=${pkgdir} install
}

pkgver() {
  cd "${pkgname%%-git}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
