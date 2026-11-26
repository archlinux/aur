# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-theme-bundles-git
pkgver=r4.792870f
pkgrel=2
pkgdesc="Built-in theme bundles for the COSMIC desktop environment"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-theme-bundles"
license=(
  'CC-BY-SA-4.0'
  'GPL-3.0-only'
)
depends=(
  'cosmic-icons-git'
  'noto-fonts'
  'ttf-opensans'
)
makedepends=(
  'git'
  'git-lfs'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/pop-os/cosmic-theme-bundles.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  git lfs install --local
  git remote add network-origin https://github.com/pop-os/cosmic-theme-bundles
  git lfs fetch network-origin
  git lfs checkout
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
