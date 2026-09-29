# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=discipulus-bin
_pkgname=discipulus
pkgver=0.2.8
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
sha256sums=('974ac29299a1ed233b9138851a9fdb1e020c97dcbb51c75dbf82627a3860ca10')
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
