# Maintainer: Coffee Bean <beanc904@gmail.com>
pkgname=musicxx-bin
_pkgname=musicxx
pkgver=0.85.4
pkgrel=1.0
pkgdesc="Audio and video player"
arch=(x86_64)
url="https://github.com/coolight7/musicxx"
_url="https://github.com/beanc904/musicxx-arch"
license=('MIT')
depends=('gtk3' 'util-linux-libs' 'xz')
makedepends=('7zip')
options=('!strip')
# install=.install
# source=("$_pkgname-$pkgver.appimage")
source=("${_pkgname}-${pkgver}.appimage::${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.appimage")
sha256sums=(0c2b09f472d3ec916ad24c5240b03f825450f2099392cc9f7a08b5f55ad1f317)

prepare () {
  chmod +x "${_pkgname}-${pkgver}.appimage"
  7z x ${srcdir}/${_pkgname}-${pkgver}.appimage -o${srcdir}/squashfs-root
  sed -i -E "s|Exec=musicxx|Exec=/opt/musicxx/${_pkgname}|g" "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop"
  sed -i -E "s|Icon=musicxx|Icon=/opt/musicxx/${_pkgname}.png|g" "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop"
}

package () {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/run.bool.${_pkgname}.desktop"
}
