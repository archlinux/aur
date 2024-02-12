# Maintainer : quagsirus <quagsirus at catpowered dot net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <danielbermond@yahoo.com>

pkgname=ffnvcodec-headers-11-1
pkgver=11.1.5.3
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs (Version 11.1 for driver 470.xx support)'
provides=('ffnvcodec-headers')
conflicts=('ffnvcodec-headers')
arch=(any)
url=https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git
license=(MIT)
makedepends=(git)
_tag=2c961f06047c31da56d9e1557ea395f3fef20277
source=(git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd nv-codec-headers

  git describe --tags | sed 's/^n//'
}

build() {
  make PREFIX=/usr -C nv-codec-headers
  sed -n '4,25p' nv-codec-headers/include/ffnvcodec/nvEncodeAPI.h > LICENSE # Extract license
  sed -i '1,22s/^.\{,3\}//' LICENSE # Delete C comments
}

package() {
  make PREFIX=/usr DESTDIR="${pkgdir}" -C nv-codec-headers install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/ffnvcodec-headers/
}

# vim: ts=2 sw=2 et:
