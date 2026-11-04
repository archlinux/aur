# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen3.8 Flash Next.
# Desktop GUI is WPF and Windows-only; the release ships a self-contained CLI for Linux.
pkgname=discimagestudio-bin
pkgver=1.4.0
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
sha256sums_x86_64=('23d39873b0fb8fee04cff60fa128b0419afeb70362d31dc8e05b8fe7328b4244')
source_aarch64=("DiscImageStudio-CLI-${pkgver}-linux-arm64.tar.gz::$url/releases/download/v$pkgver/DiscImageStudio-CLI-v$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('9e231c0d5cde0a31c7601d21707cadac2a49454fad62ebf2e820cb742a22c071')

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
