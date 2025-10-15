# Maintainer: John Trengrove <john at weaviate dot-symbol io>

pkgname=weaviate-bin
pkgver=1.32.11
pkgrel=1
pkgdesc='An open source vector database written in Go'
arch=('x86_64')
url='https://weaviate.io'
license=('BSD-3-Clause')
conflicts=('weaviate')
provides=('weaviate')
depends=('glibc')
source=("${pkgname}-${pkgver}.tgz::https://github.com/weaviate/weaviate/releases/download/v${pkgver}/weaviate-v${pkgver}-linux-amd64.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/weaviate/weaviate/v${pkgver}/LICENSE"
        "weaviate.default"
        "weaviate.service"
        "weaviate.sysusers"
        "weaviate.tmpfiles")

sha256sums=('529b45d386cb1b7a48612b3d7d5ec66918dfc27b602d2bd25d8a55f90c0085e1'
            '8b15b1d621063969959512d6fa088546e0cff13b81681f00981d08fd7c80fcc9'
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
