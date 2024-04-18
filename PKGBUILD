# Maintainer: fubarhouse
pkgname=skpr
provides=("skpr-rsh")
pkgver=0.28.2
pkgrel=1.7
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("skpr_v${pkgver}.deb::http://packages.skpr.io/apt/pool/main/skpr/skpr_${pkgver}_linux_amd64.deb")
sha512sums=('cb9407d436d9b5ae24d206ad4c80cc7c460ba8d665c1040a4979dadb0cb832075607b55dd0ea8fdeed011e05504fc6b7826a019f1f5f469b7ca78f5d862c9702')
provides=(skpr skpr-rsh)

package() {
  bsdtar -xf "$srcdir/skpr_v${pkgver}.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}-rsh"

  mv "${pkgdir}/usr/bin/${pkgname}" .
  mv "${pkgdir}/usr/bin/${pkgname}-rsh" .

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-rsh" "${pkgdir}/usr/bin/${pkgname}-rsh"
}
