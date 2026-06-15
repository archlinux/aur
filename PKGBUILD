# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Bermond <danielbermond@yahoo.com>

pkgname=ffnvcodec-headers
pkgver=13.0.19.0
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs'
arch=(any)
url=https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git
license=(MIT)
makedepends=(git)
_tag=e844e5b26f46bb77479f063029595293aa8f812d
source=(git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git#tag=${_tag})
sha256sums=('1b6190ddb4b36356ab3d4c2d53ed613aec077748a28c3ef7fff53047662b245b')

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
