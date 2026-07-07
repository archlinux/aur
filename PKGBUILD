# Maintainer: Coffee Bean <beanc904@gmail.com>
pkgname=musicxx-bin
_pkgname=musicxx
pkgver=0.86.5
pkgrel=1.0
provides=('musicxx')
conflicts=('musicxx')
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
sha256sums=('cf1d099a7a3d28d32391e2a6afe5580a3b77a535ce884f352bcce9700450056c')

prepare () {
  chmod +x "${_pkgname}-${pkgver}.appimage"
  7z x ${srcdir}/${_pkgname}-${pkgver}.appimage -o${srcdir}/squashfs-root
  sed -i -E "s|Exec=musicxx|Exec=/opt/musicxx/AppRun|g" "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop"
  sed -i -E "s|Icon=musicxx|Icon=/opt/musicxx/${_pkgname}.png|g" "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop"
}

package () {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
  install -Dm644 "${srcdir}/squashfs-root/run.bool.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/run.bool.${_pkgname}.desktop"
}
