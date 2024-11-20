
_pkgname=wemeet-wayland-screenshare
pkgname=wemeet-wayland-screenshare-git
provides=('wemeet-wayland-screenshare')
pkgver=3.19.2.400_hooked
pkgrel=2
pkgdesc='Hooked wemeet that enables screenshare on KDE Wayland. 实现KDE Wayland下腾讯会议屏幕共享.'
arch=('x86_64')
license=('MIT')
url="https://github.com/xuwd1/wemeet-wayland-screenshare"
source=(
    'git+https://github.com/xuwd1/wemeet-wayland-screenshare.git'
    'wemeet-wayland-screenshare.sh'
    'wemeetapp-wayland-screenshare.desktop'
)
sha1sums=(
    'SKIP'
    '954148cf491bd81fea5ae2e54a5a26a91b45c998'
    '5e2b7c2283812336a0c97f6cf64593aee84cf5ee'
)
depends=(
    'wemeet-bin'
    'pipewire-media-session'
    'libportal'
    'xdg-desktop-portal'
    'xdg-desktop-portal-kde'
    'qt5-wayland'
)
makedepends=(
    'cmake'
)

_starter="wemeet-wayland-screenshare.sh"
_libhook="libhook.so"
_desktop_entry_file="wemeetapp-wayland-screenshare.desktop"


prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -Dm755 "$srcdir/$_starter" "$pkgdir/usr/bin/wemeet-wayland-screenshare"
    install -Dm755 "$srcdir/$_pkgname/build/$_libhook" "$pkgdir/usr/lib/wemeet/$_libhook"
    mkdir -p $pkgdir/usr/share/applications
    install -Dm644 "$srcdir/$_desktop_entry_file" "$pkgdir/usr/share/applications/$_desktop_entry_file"
}
