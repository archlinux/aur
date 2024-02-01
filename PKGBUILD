# Maintainer: fubarhouse
pkgname=skpr
provides=("skpr-rsh")
pkgver=0.26.0
pkgrel=1.6
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("skpr_v${pkgver}.deb::http://packages.skpr.io/apt/pool/main/skpr/skpr_${pkgver}_linux_amd64.deb")
sha512sums=('d5a88e5053ac097c33dd87a5eef3a76c45c4df9fa9f2186393c10b2d87b3ba49296ba577a1f7603bf1f7702ed3427870ac8cdaa168a1cd23c3e104eda0002d42')
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
