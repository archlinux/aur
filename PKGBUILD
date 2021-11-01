# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=av1an
pkgver=0.2.0
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('x86_64')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('cargo' 'nasm' 'clang')
depends=('ffmpeg' 'aom' 'vapoursynth')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'vmaf: VMAF calculation support'
            'mkvtoolnix-cli: mkvmerge support'
            'ffms2'
            'vapoursynth-plugin-lsmashsource')
conflicts=('python-av1an')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('988779c38626fdaa60a76ceb4156b95a26cb65696dc99a49a2b6cc1ba79755cd')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  RUSTUP_TOOLCHAIN=stable cargo build --release --target-dir=target --frozen --no-default-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 target/release/av1an -t "${pkgdir}/usr/bin"
}
