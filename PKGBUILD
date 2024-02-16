# Maintainer: fubarhouse
pkgname=skpr
provides=("skpr-rsh")
pkgver=0.26.1
pkgrel=1.6
pkgdesc="CLI tool for managing web applications on the platform."
arch=('x86_64')
url="https://github.com/skpr/cli"
license=('MIT')
source=("skpr_v${pkgver}.deb::http://packages.skpr.io/apt/pool/main/skpr/skpr_${pkgver}_linux_amd64.deb")
sha512sums=('3f0a1894121702113d4a92bb142289144da70caaa15b278ed26e1de65b0ad8d6376079432e2764cb7e40eca39084ef486b9e115bf0463135bbbe60542468677e')
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
