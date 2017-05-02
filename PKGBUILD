# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver=4.2.0.17.097.0719
pkgrel=1
pkgdesc="SQL Developer command line interface for Oracle"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html"
license=('custom:OTN')
depends=('java-runtime>=8')

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

source=("LICENSE"
        "manual://${pkgname}-${pkgver}-no-jre.zip"
        "sqlcl.sh")
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '35d2afeb9a298d9b421b9e2d35f224737d7a7bd12167adc0bb33144466b1961c'
            '80131698ef004e0a15ba7ad90a56c49110c0e2e103217ef1e618b7e9b5bfd05a')

msg "Warning: This software cannot be downloaded automatically."
plain "You will need to sign up for an Oracle account and download the software from"
plain "Oracle directly.  Place the downloaded file in the same directory as the"
plain "PKGBUILD and re-run makepkg."
plain ""
plain "The source .zip files can be downloaded from:"
plain ""
plain "https://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html"
plain ""
plain ""

package() {
  cd ${srcdir}/${pkgname}
  install -d "${pkgdir}/opt/${pkgname}/lib"
  install -d "${pkgdir}/usr/bin"
  install -m 644 -t "$pkgdir/opt/${pkgname}/lib" lib/*.jar
  install -m 755 ${srcdir}/sqlcl.sh "$pkgdir/usr/bin/sqlcl"
}
