# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=discipulus-bin
_pkgname=discipulus
pkgver=0.2.9
pkgrel=1
pkgdesc="Alternative Openbare Magister App voor Android, iOS, iPadOS, WatchOS, WearOS, macOS, Linux en Windows"
arch=('x86_64')
url="https://github.com/DiscipulusApp/Discipulus"
license=('GPL-3.0-only')
provides=('discipulus')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'glibc'
  'desktop-file-utils'
)
options=('!strip' '!debug')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Linux.-.Discipulus_x86_64.tar.gz"
)
sha256sums=('3b37f8ba0f4a6e04b4244833444be35b6b656e54b044cdb3680e675dff1e32b5')
install=discipulus.install

package() {
  cd "${srcdir}/bundle/"
  
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a . "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/discipulus" "${pkgdir}/usr/bin/discipulus"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop" 
  install -Dm644 "icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
