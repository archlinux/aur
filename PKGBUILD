# Maintainer: Ruben Solvang <post@rubensolvang.no>
pkgname=bas21-bin
pkgver=1.4.6
pkgrel=1
pkgdesc="A norwegian accounting and invoice system"
arch=('x86_64')
url=https://bas21.no
license=('custom')
makedepends=('gendesk')
sha256sums=('14d365c6dfdec55ea05009f4ee58ed7ac1f22dc2f09261304bafbb7d4a89cf0b')
options=('!strip')
source=("https://download.bas21.no/bas21/bas21-$pkgver.tar.xz")

prepare() {
  gendesk -f -n --pkgname "${pkgname%-bin}" --pkgdesc "pkgdesc" --name='BAS21'
}

package() { 
  install -d "${pkgdir}/opt/${pkgname%-bin}"
  cp -a "bas21-${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-bin}/bas21" "${pkgdir}/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/bascore.ico" "${pkgdir}/usr/share/icons/${pkgname%-bin}.ico"
}
