# Maintainer: Oldlamps <AUR@oldlamps.anonaddy.com>
pkgname=theophany-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern, high-performance game library manager and launcher built with Rust and QML. ROMs, Steam, Epic Games (Legendary), and eXoDOS imports"
arch=('x86_64')
url="https://github.com/oldlamps/Theophany"
license=('GPL-3.0-only')
provides=('theophany')
conflicts=('theophany')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-declarative' 'qt6-5compat' 'qt6-svg')
optdepends=('yt-dlp: for downloading game trailers and media')

source=("theophany-${pkgver}::${url}/releases/download/v${pkgver}/theophany_linux_x64"
        "theophany.png::https://github.com/oldlamps/Theophany/raw/refs/heads/main/assets/tray_icon.png"
        "theophany.desktop")

# I've set these to 'SKIP' so you can run 'updpkgsums' to get the fresh hashes for the new files
sha256sums=('b71434540a290198db96a15756841b3f0c2729a16bd0aef91e1ddc93f2c6c3be'
            'fd14eb407f45dace71b084e3f7ab523822075058326b1840f366e4da2ca2915e'
            '4163f4a5c268f0cb0281908a3fa537671e349999b5e263bd7d7430f11349b76d')

package() {
    # 1. Install the binary (using the new versioned filename)
    install -Dm755 "${srcdir}/theophany-${pkgver}" "${pkgdir}/usr/bin/theophany"

    # 2. Install the icon to the standard hicolor theme location
    install -Dm644 "${srcdir}/theophany.png" "${pkgdir}/usr/share/pixmaps/theophany.png"

    # 3. Install the desktop entry
    install -Dm644 "${srcdir}/theophany.desktop" "${pkgdir}/usr/share/applications/theophany.desktop"
}
