# Maintainer: judecale <security@nui.cat>
pkgname=nuicat-bin
pkgver=0.1.17
pkgrel=1
pkgdesc='Speech-to-text dictation for Linux desktop'
arch=('x86_64')
url='https://nui.cat'
license=('LicenseRef-proprietary')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'openssl')
optdepends=(
    'vulkan-icd-loader: GPU-accelerated local transcription'
    'wl-clipboard: Wayland clipboard support'
)
provides=('nuicat')
conflicts=('nuicat')
install=nuicat-bin.install
source=("nuicat_amd64.deb::https://packages.nui.cat/releases/v0.1.17/nuicat_amd64.deb")
noextract=('nuicat_amd64.deb')
sha256sums=('c745fe68bb33e9b53d3642505d2da7b4c65270fbc8fd2a9bd04636f206e8e470')

prepare() {
    cd "$srcdir"
    bsdtar -xf nuicat_amd64.deb
    bsdtar -xf data.tar.*
}

package() {
    install -Dm755 "$srcdir/usr/bin/nui" "$pkgdir/usr/bin/nui"
    install -Dm644 "$srcdir/usr/lib/systemd/user/nuicat.service" "$pkgdir/usr/lib/systemd/user/nuicat.service"
    install -Dm644 "$srcdir/usr/lib/udev/rules.d/99-nuicat.rules" "$pkgdir/usr/lib/udev/rules.d/99-nuicat.rules"
    install -Dm644 "$srcdir/usr/share/applications/nuicat.desktop" "$pkgdir/usr/share/applications/nuicat.desktop"
    install -Dm644 "$srcdir/etc/xdg/autostart/nuicat.desktop" "$pkgdir/etc/xdg/autostart/nuicat.desktop"
    install -Dm644 "$srcdir/usr/share/icons/hicolor/scalable/apps/nuicat.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nuicat.svg"
}
