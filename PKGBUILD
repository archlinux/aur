# Maintainer: robertfoster

pkgname=orion-desktop
pkgver=0.0.10
pkgrel=1
pkgdesc="A powerful, lightweight, fast BitTorrent client, with beautiful user experience and fastest video and audio streaming capabilities"
arch=('x86_64')
url="https://snapcraft.io/orion-desktop"
license=('PROPRIETARY')
options=('!strip')
depends=(
  'brotli'
  'bzip2'
  'double-conversion'
  'e2fsprogs'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'graphite'
  'gst-plugins-base-libs'
  'gstreamer'
  'harfbuzz'
  'hyphen'
  'icu'
  'keyutils'
  'krb5'
  'libcap'
  'libelf'
  'libffi'
  'libgcrypt'
  'libglvnd'
  'libgpg-error'
  'libjpeg-turbo'
  'libpng'
  'libunwind'
  'libwebp'
  'libxau'
  'libxcb'
  'libxdmcp'
  'libxml2'
  'libxslt'
  'lz4'
  'md4c'
  'openssl'
  'orc'
  'pcre'
  'pcre2'
  'qt5-base'
  'qt5-declarative'
  'qt5-location'
  'qt5-sensors'
  'qt5-webchannel'
  'qt5-webkit'
  'sqlite'
  'woff2'
  'xz'
  'zlib'
  'zstd'
)

makedepends=('squashfs-tools')
sha256sums=('fe8c4be513d2d88a07cdc4c7d073adf84a1a2b25c25ea8c12010456006ff1cca'
            '25f7ceaaec37eb9c287abeb839ba2036738eb363079e321c2bd410fa48301dd6'
            '71420954985d07f63c8195d5e6ff12c55ac366d99fd3024846bbdc8463af2579'
            '4991a25e728da947d59c31d9a790f2edaf04ae073bd267ea2ffcf519fe12f274')

DLAGENTS+=("snap::${BASH_SOURCE[0]%/*}/snap-dlagent.sh %u %o")
source=("${pkgname}-${pkgver}.squashfs::snap://api.snapcraft.io/v2/snaps/info/orion-desktop"
  snap-dlagent.sh
  "${pkgname}.desktop"
  "${pkgname}.sh"
)

prepare() {
  cd "${srcdir}"

  msg2 "Extraction..."
  unsquashfs ${pkgname}-${pkgver}.squashfs
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/"
  cp -r squashfs-root "${pkgdir}/opt/${pkgname}"
  install -Dm755 orion-desktop.sh \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 squashfs-root/meta/gui/icon.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
