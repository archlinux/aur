# Maintainer: Eric Woudstra <ericwouds@gmail.com>
pkgname=bpir64-mkimage
pkgver=2021.10
pkgrel=1
pkgdesc='An acoustic spectrum analyser (compiled against wxGtk3 and ffmpeg4.4)'
arch=(aarch64)
url='http://spek.cc/'
license=(GPL3)
depends=()
makedepends=()
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.tar.gz"
        'mtkimage-buffer-inc.patch'
        'mtkimage-gpt-expand.patch')
sha256sums=(SKIP SKIP SKIP)

build() {
    cd "${srcdir}/u-boot-${pkgver}"
    patch -p1 -N -r - < "${srcdir}/mtkimage-buffer-inc.patch"
    patch -p1 -N -r - < "${srcdir}/mtkimage-gpt-expand.patch"
    ARCH=arm64 make mt7622_rfb_defconfig tools-only
    cp -vf tools/mkimage tools/bpir64-mkimage
}

package() {
  cd "${srcdir}/u-boot-${pkgver}/tools"
  install -m755 -vDt $pkgdir/usr/bin bpir64-mkimage
}
