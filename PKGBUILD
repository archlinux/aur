# Maintainer: XurxoMF <xurxomf@xurxomf.xyz>

pkgname=vs-launcher
pkgbase=vs-launcher
pkgver=1.5.8
pkgrel=2
pkgdesc="Unofficial launcher and version manager for Vintage Story"
arch=('x86_64')
url="https://vsldocs.xurxomf.xyz/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'ffmpeg' 'dotnet-runtime-7.0' 'dotnet-runtime-8.0')
source=("https://github.com/XurxoMF/vs-launcher/releases/download/$pkgver/vs-launcher-$pkgver.deb" "LICENSE" "vs-launcher.desktop" "vs-launcher-wrapper")
sha256sums=('fa584d5c849ff82ab6132257310e04b9a4c5a72d59de16679c023acce8ea77ce' "SKIP" "SKIP" "SKIP")

prepare() {
    bsdtar -xf "$srcdir/vs-launcher-$pkgver.deb"
    mkdir -p "$srcdir/vs-launcher"
    bsdtar -xf "$srcdir/data.tar.xz" -C "$srcdir/vs-launcher"
}

package() {
    cp -R "$srcdir/vs-launcher/." "$pkgdir"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/vs-launcher-wrapper" "$pkgdir/usr/bin/vs-launcher-wrapper"
    install -Dm644 "$srcdir/vs-launcher.desktop" "$pkgdir/usr/share/applications/vs-launcher.desktop"
}
