# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=1.5.0
pkgrel=1
pkgdesc="Game library manager and launcher for Linux"
arch=('x86_64')
url="https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt"
license=('GPL-3.0')
depends=('python-requests' 'python-babel' 'python-evdev' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'python-libarchive-c' 'pyside6' 'python-rapidfuzz' 'python-pefile' 'python-pillow' 'perl-image-exiftool' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'file' 'findutils' 'gawk' 'grep' 'tar' 'xz' 'zstd' 'gzip' 'unrar' 'qt6-svg' 'qt6-imageformats' 'qt6-multimedia' 'pciutils' 'mesa-utils' 'vulkan-icd-loader' 'procps-ng' 'psmisc' '7zip' 'python-dbus-fast' 'sdl3' 'desktop-file-utils')
makedepends=('meson' 'ninja' 'vulkan-headers' 'gettext' 'sdl3')
conflicts=("portprotonqt-steam-compat")
provides=('portprotonqt-steam-compat')
replaces=('portprotonqt-steam-compat')
optdepends=(
    'networkmanager: System tab network management'
    'bluez: System tab bluetooth management'
    'upower: System tab bluetooth battery level'
    'libpulse: System tab audio volume/output management'
    'python-qrcode: Wi-Fi QR code generation'
    'squashfs-tools: for legacy PortProton prefix backup support'
)
source=("git+https://git.linux-gaming.ru/Linux-Gaming/PortProtonQt#tag=v$pkgver")
sha256sums=('6c30909a4152a0234880082cde74334b0476c33c8e748d6c98795f9f3d2586c7')

build() {
    arch-meson PortProtonQt build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build --skip-subprojects

    bash "$srcdir/PortProtonQt/dev-scripts/generate-completions.sh"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt" -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/portprotonqt.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dpm 0644 "$srcdir/PortProtonQt/completions/_portprotonqt" -t "$pkgdir/usr/share/zsh/site-functions"
}

