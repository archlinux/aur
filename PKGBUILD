# Maintainer: Karl Ludwig Brennan <karlludwigbrennan@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <danielbermond@yahoo.com>

pkgname=ffnvcodec-headers12.0
pkgver=12.0.16.1
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs (version 12.0)'
arch=(any)
url=https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git
license=(MIT)
makedepends=(git)
conflicts=('ffnvcodec-headers')
provides=('ffnvcodec-headers')
_tag=451da99614412a7f9526ef301a5ee0c7a6f9ad76
source=(git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git#tag=${_tag})
sha256sums=('71cec387fe1d2aabb246519ca09cbe600915dde437708835957e2219d991c645')

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
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/ffnvcodec-headers12.0/
}

# vim: ts=2 sw=2 et:
