# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Hy4 flash Free.
# Desktop GUI is WPF and Windows-only; the release ships a self-contained CLI for Linux.
pkgname=discimagestudio-bin
pkgver=1.7.0
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
sha256sums_x86_64=('ae5ed37b1219febeab7eaba8b38c47a77b7988ab3ea42caf7ab762419885e9b3')
source_aarch64=("DiscImageStudio-CLI-${pkgver}-linux-arm64.tar.gz::$url/releases/download/v$pkgver/DiscImageStudio-CLI-v$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('fbe9663af50d05b19a642d59c614ceff79f9a650c07f8d4b1fa77ad39d182b49')

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
