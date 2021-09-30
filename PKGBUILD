# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-nvfbc
pkgver=0.0.4
pkgrel=2
pkgdesc="OBS Studio source plugin for NVIDIA FBC API"
arch=('x86_64')
license=('GPL2')
url="https://gitlab.com/fzwoch/obs-nvfbc"
depends=('obs-studio')
optdepends=('nvidia-utils-keylase: enable NvFBC on GeForce cards')
makedepends=('git' 'meson')
source=("git+https://gitlab.com/fzwoch/obs-nvfbc.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/obs-nvfbc"
  git cherry-pick --no-commit 161daac6e85f17410b85dac3d9e9bedc1979ea69
}

build() {
  meson "$srcdir/$pkgname" build --prefix=/usr
  ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}