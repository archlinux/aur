# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen3.8 Flash Next.
# Desktop GUI is WPF and Windows-only; the release ships a self-contained CLI for Linux.
pkgname=discimagestudio-bin
pkgver=1.4.2
pkgrel=1
pkgdesc='Disc Image Studio CLI: generate and burn visible image-mapped CD, DVD and BD-R discs (prebuilt Linux CLI, GUI is Windows-only)'
arch=('x86_64' 'aarch64')
url='https://github.com/JiaFeiMiao-K-Cat/DiscImageStudio'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('discimagestudio')
conflicts=('discimagestudio')
options=('!strip' '!debug')

source_x86_64=("DiscImageStudio-CLI-${pkgver}-linux-x64.tar.gz::$url/releases/download/v$pkgver/DiscImageStudio-CLI-v$pkgver-linux-x64.tar.gz")
sha256sums_x86_64=('335bf4e5ebe4881dfc2de8a4018c012e85d3b1a8b76a44ea7a2d2282e43fd8eb')
source_aarch64=("DiscImageStudio-CLI-${pkgver}-linux-arm64.tar.gz::$url/releases/download/v$pkgver/DiscImageStudio-CLI-v$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('0e5fd6220126b42f1d921e1056241df8876bd9856830caabbee8560d98e573f5')

build() {
    # The release tarball has no top-level directory: files land in $srcdir.
    cd "$srcdir"

    # regression check only when building natively (a foreign-arch ELF won't run here)
    if [[ $CARCH == "$(uname -m)" ]]; then
        ./disc-image-studio selftest
    fi
}

package() {
    cd "$srcdir"

    install -Dm755 disc-image-studio "$pkgdir/usr/bin/disc-image-studio"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD-PARTY-NOTICES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
