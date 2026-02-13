# Maintainer: fEst <refer.nfs@gmail.com>
pkgname=pipewire-audio-idle-inhibit-git
_ver=0.4.2
pkgver=$_ver.r84.fea38e4
pkgrel=1
pkgdesc="Prevents the screen from sleeping while audio is actively playing or being recorded through Pipewire"
_pkgfoldername=PipewireAudioIdleInhibit
url="https://github.com/The1fEst/$_pkgfoldername"
arch=(
    $CARCH
    'aarch64' # ARM v8 64-bit
    'armv7h'  # ARM v7 hardfloat
)
license=(GPL)
depends=("systemd-libs" "libpipewire" "systemd")
install=$pkgname.install
makedepends=(gcc meson git)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgfoldername
  printf "$_ver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgfoldername
}

build() {
  arch-meson $_pkgfoldername build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
