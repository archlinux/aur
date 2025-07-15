# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-wallpapers-git
pkgver=1.0.0.alpha.7.r0.g189c2c6
pkgrel=1
pkgdesc="Wallpapers for the COSMIC Desktop Environment"
arch=('any')
url="https://github.com/pop-os/cosmic-wallpapers"
license=('CC-BY-4.0 AND LicenseRef-custom')
makedepends=(
  'git'
  'git-lfs'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-wallpapers.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-wallpapers
  git lfs fetch network-origin
  git lfs checkout
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
