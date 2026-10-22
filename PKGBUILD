# Maintainer: lostmason <lostmason@tutamail.com>
# Contributor: blx32 <gmoura96@icloud.com>
pkgname=xeres-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='A decentralized and secure application designed for communication and sharing.'
arch=('x86_64')
url="https://xeres.io"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libglvnd'
  'libx11'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'libxxf86vm'
  'pango'
  'xdg-utils'
  'zlib'
)
source=("https://github.com/zapek/Xeres/releases/download/v${pkgver}/xeres_${pkgver}_ubuntu-24.04_amd64.deb")
sha512sums=('3e0565c03c2a26e17e6b5522d4bf6193605506743b24a458d59e386ad79751705a61cacbabf93d1232693c71c6651f5c27fb020c0981d06bca5c04c83435a644')
provides=('xeres')
conflicts=('xeres')
options=('!strip')

prepare() {
  cd "${srcdir}"
  tar -xf data.tar.zst
  sed -i \
    -e "s/^Comment=.*/Comment=${pkgdesc}/" \
    -e 's/^Categories=.*/Categories=Network;InstantMessaging;P2P;/' \
    -e '/^MimeType=$/d' \
    opt/xeres/lib/xeres-Xeres.desktop
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/opt"
  cp -a opt/xeres "${pkgdir}/opt/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/xeres/bin/Xeres "${pkgdir}/usr/bin/xeres"

  install -Dm644 "${srcdir}/opt/xeres/lib/xeres-Xeres.desktop" "${pkgdir}/usr/share/applications/xeres.desktop"
  install -Dm644 "${srcdir}/opt/xeres/lib/Xeres.png" "${pkgdir}/usr/share/pixmaps/xeres.png"
}
