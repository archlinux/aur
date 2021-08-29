# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname=sway-audio-idle-inhibit-git
pkgver=0.1
pkgrel=1
pkgdesc="Prevents swayidle from sleeping while any application is outputting or receiving audio"
_pkgfoldername=SwayAudioIdleInhibit
url="https://github.com/ErikReider/$_pkgfoldername"
arch=(x86_64)
license=(GPL)
depends=("wayland>=1.14.91" "wayland-protocols" "libpulse")
makedepends=(gcc meson git)
optdepends=("swaync-git" "swaysettings-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgfoldername
  git checkout main
  git pull
}

build() {
  arch-meson $_pkgfoldername build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
