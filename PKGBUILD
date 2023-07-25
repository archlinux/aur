# Maintainer: John Trengrove <john at weaviate dot-symbol io>

pkgname=weaviate-bin
pkgver=1.20.2
pkgrel=1
pkgdesc='An open source vector database written in Go'
arch=('x86_64')
url='https://weaviate.io'
license=('BSD')
conflicts=('weaviate')
provides=('weaviate')
depends=('glibc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/weaviate/weaviate/releases/download/v${pkgver}/weaviate-v${pkgver}-linux-amd64.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/weaviate/weaviate/v${pkgver}/LICENSE"
        "weaviate.default"
        "weaviate.service"
        "weaviate.sysusers"
        "weaviate.tmpfiles")

sha256sums=('8dcdb5a1730cc6187f789e1017e70114ab718b2728ee4452d618415799e4f6b9'
            '842b046d8650148dce39b625a3fb1ef167652b20c5660fdf65233e4334c1baf4'
            'a375b1c55be48563ea3284a264352f1673c3f8e8f83bfd337c2ddfaeb532ce6d'
            '1507f4003ed6d3d5230cc9570e6f69c3be6177b52496b976f10a93519626b86a'
            'a644fc4eaa46e97381df09b5321e60a9ca1cfdac67277b8fe103fb4bd96d4fa0'
	    '557f6c52ca3c4dc261a5ff11e4d998b9f66690c8ee2075450a2a225107b58f57')

package() {
  # binary
  install -Dm755 "${srcdir}/weaviate" "${pkgdir}/usr/bin/weaviate"

  # user/group & owned directories
  install -Dm644 "${srcdir}/weaviate.sysusers" "${pkgdir}/usr/lib/sysusers.d/weaviate.conf"
  install -Dm644 "${srcdir}/weaviate.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/weaviate.conf"

  # services & runtime
  install -Dm644 "${srcdir}/weaviate.service" "${pkgdir}/usr/lib/systemd/system/weaviate.service"
  install -Dm644 "${srcdir}/weaviate.default" "${pkgdir}/etc/default/weaviate"

  # licenses
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
