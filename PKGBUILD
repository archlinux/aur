# Maintainer: kloogans <https://github.com/kloogans>
pkgname=yappie
pkgver=r3.e490525
pkgrel=1
pkgdesc='Voice dictation for Wayland with local whisper.cpp support'
arch=('x86_64')
url='https://github.com/kloogans/yappie-linux'
license=('MIT')
depends=('pipewire' 'curl' 'ydotool' 'wl-clipboard' 'libnotify')
optdepends=(
    'whisper.cpp: local on-device transcription'
    'whisper.cpp-cuda: local transcription with NVIDIA GPU'
    'whisper.cpp-vulkan: local transcription with Vulkan GPU'
    'hyprland: smart terminal paste detection'
    'sway: smart terminal paste detection'
)
makedepends=('git' 'meson' 'ninja')
install=yappie.install
source=("$pkgname::git+https://github.com/kloogans/yappie-linux.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    meson setup build --prefix=/usr --buildtype=release
    meson compile -C build
}

package() {
    cd "$pkgname"
    meson install -C build --destdir="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
