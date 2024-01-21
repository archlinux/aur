# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Robosky <fangyuhao0612@gmail.com>
pkgname=tela-icon-theme-git
pkgver=2023.06.25.r17.g5066ac9b
pkgrel=1
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://github.com/vinceliuice/Tela-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/vinceliuice/Tela-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Tela-icon-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Tela-icon-theme

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package() {
  cd Tela-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

