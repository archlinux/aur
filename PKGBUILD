# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ffmpeg-dektec-bin
pkgver=9.0.2_dektec12
pkgrel=1
epoch=1
_tag="n${pkgver%%_*}-${pkgver#*_}"
pkgdesc='FFmpeg with DekTec SDI, DVB-ASI and SMPTE ST 2110 devices (prebuilt DekTec Linux release)'
arch=('x86_64')
url='https://github.com/dektec-com/ffmpeg-dektec'
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'MIT' 'Apache-2.0' 'Zlib' 'curl')
depends=(
  'dektec-drivers-dkms'
  'glibc'
  'sdl2'
)
provides=('ffmpeg-dektec')
conflicts=('ffmpeg-dektec')
# Nothing is built here, so !lto is irrelevant; !debug keeps makepkg from
# producing an empty -debug package for DekTec's already-stripped binaries.
options=('!debug')
source=("${pkgname}-${_tag}-linux64.tar.xz::https://github.com/dektec-com/ffmpeg-dektec/releases/download/${_tag}/ffmpeg-dektec-${_tag}-linux64.tar.xz")
sha256sums=('e9dfbb770280eb3a443276ae9583433295e26f1e7f5c3afaf67aa281b9a5efbe')

package() {
  cd "ffmpeg-dektec-${_tag}-linux64"

  install -vDm 755 'bin/ffmpeg' "${pkgdir}/usr/bin/ffmpeg-dektec"
  install -vDm 755 'bin/ffplay' "${pkgdir}/usr/bin/ffplay-dektec"
  install -vDm 755 'bin/ffprobe' "${pkgdir}/usr/bin/ffprobe-dektec"

  install -vDm 644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -vDm 644 'COPYING.LGPLv2.1' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LGPLv2.1"
  install -vDm 644 'README.txt' "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  for f in licenses/*.txt; do
    install -vDm 644 "$f" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "$f")"
  done
}

# vim: set ts=2 sw=2 et:
