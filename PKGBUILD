# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=av1an
pkgver=0.1.0
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('x86_64')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('cargo' 'nasm')
depends=('ffmpeg' 'aom' 'vapoursynth')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'svt-vp9: SVT-VP9 encoder support'
            'vmaf: VMAF calculation support'
            'mkvtoolnix-cli: mkvmerge support'
            'ffms2'
            'vapoursynth-plugin-lsmashsource')
provides=('python-av1an')
conflicts=('python-av1an')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('48b94bb6124015eff42f3f19f02c55b5371a5f50394cf690ef4fe76755289835')

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
