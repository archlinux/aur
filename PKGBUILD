# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-wallpapers-git
pkgver=r4.0f2f16d
pkgrel=2
pkgdesc="Wallpapers for the COSMIC Desktop Environment"
arch=('any')
url="https://github.com/pop-os/cosmic-wallpapers"
license=('LicenseRef-unknown')
makedepends=('git' 'git-lfs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-wallpapers.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
