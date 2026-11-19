# Maintainer : MorsMortium <mors.mortium.8@protonmail.com>

_pkgname=klaviature
pkgname="${_pkgname}-git"
pkgver=r24.ff04c7f
pkgrel=1
pkgdesc='A very customizable virtual keyboard for KDE Plasma Desktop and Mobile.'
arch=('x86_64')
url="https://codeberg.org/The-World-Machine/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('qt6-base' 'qt6-tools' 'layer-shell-qt' 'libxkbcommon' 'hicolor-icon-theme')
makedepends=('git' 'wayland-protocols' 'cmake')
optdepends=('ydotool: ydotool layouts')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -S ./Source/ -B ./Build -DCMAKE_INSTALL_PREFIX=/usr
  make -C ./Build
}

package() {
  cd "${srcdir}/${pkgname}"
  make -C ./Build install DESTDIR="${pkgdir}"
}
