# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers
pkgname=librepcb-nightly
pkgver=0.0.0
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (nightly AppImage version)"
arch=('x86_64')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
provides=('librepcb')
conflicts=('librepcb')
_appimage="librepcb-nightly-linux-${arch[0]}.AppImage"
noextract=("${_appimage}")
options=('!strip' '!emptydirs')
source=("https://download.librepcb.org/nightly_builds/master/${_appimage}")
sha256sums=('SKIP')

build() {
  chmod +x ${_appimage}
  ./${_appimage} --appimage-extract 2>/dev/null
  chmod -x ${_appimage}
}

package() {
  # Appimage
  install -D -m755 "${srcdir}/${_appimage}" "${pkgdir}/usr/local/bin/librepcb"

  # Metadata
  mkdir -p "${pkgdir}/usr/share"
  cp -R "squashfs-root/opt/share/applications" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/icons" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/metainfo" "${pkgdir}/usr/share/"
  cp -R "squashfs-root/opt/share/mime" "${pkgdir}/usr/share/"
  find "${pkgdir}/usr/share" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
