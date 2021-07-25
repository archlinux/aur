# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=av1an-git
pkgver=1.12.r953.gbf1b6e9
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('git' 'cargo' 'nasm')
depends=('ffmpeg' 'aom' 'vapoursynth')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'svt-vp9: SVT-VP9 encoder support'
            'vmaf: VMAF calculation support'
            'mkvtoolnix-cli: mkvmerge support'
            'ffms2'
            'vapoursynth-plugin-lsmashsource')
provides=('python-av1an' 'python-av1an-git')
conflicts=('python-av1an' 'python-av1an-git')
source=("git+https://github.com/master-of-zen/Av1an.git")
sha256sums=('SKIP')

pkgver() {
  cd "Av1an"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Av1an"
  RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --target-dir=target --locked
}

check() {
  cd "Av1an"
  RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
  cd "Av1an"
  install -Dm 755 target/release/av1an -t "${pkgdir}/usr/bin"
}
