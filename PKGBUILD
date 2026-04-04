# Maintainer: John Trengrove <john at weaviate dot-symbol io>
# Contributor: tee < teeaur at duck dot com >

pkgname=weaviate-bin
pkgver=1.36.9
pkgrel=1
pkgdesc='An open source vector database written in Go'
arch=('x86_64')
url='https://weaviate.io'
license=('BSD-3-Clause')
conflicts=('weaviate')
provides=('weaviate')
depends=('glibc')
source=("https://github.com/weaviate/weaviate/releases/download/v${pkgver}/weaviate-v${pkgver}-linux-amd64.tar.gz"
        "https://raw.githubusercontent.com/weaviate/weaviate/v${pkgver}/LICENSE"
        "weaviate.default"
        "weaviate.service"
        "weaviate.sysusers"
        "weaviate.tmpfiles")

sha256sums=('d2f9c0591be0d3c221ad37b7c9b166d21be52cf1b5f60ac58d8a5c14b62acd1b'
            '8b15b1d621063969959512d6fa088546e0cff13b81681f00981d08fd7c80fcc9'
            'a375b1c55be48563ea3284a264352f1673c3f8e8f83bfd337c2ddfaeb532ce6d'
            '1507f4003ed6d3d5230cc9570e6f69c3be6177b52496b976f10a93519626b86a'
            'a644fc4eaa46e97381df09b5321e60a9ca1cfdac67277b8fe103fb4bd96d4fa0'
            '557f6c52ca3c4dc261a5ff11e4d998b9f66690c8ee2075450a2a225107b58f57')

package() {
  # binary
  install -Dm755 "${srcdir}/weaviate" -t "${pkgdir}/usr/bin/"

  # user/group & owned directories
  install -Dm644 "${srcdir}/weaviate.sysusers" "${pkgdir}/usr/lib/sysusers.d/weaviate.conf"
  install -Dm644 "${srcdir}/weaviate.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/weaviate.conf"

  # services & runtime
  install -Dm644 "${srcdir}/weaviate.service" "${pkgdir}/usr/lib/systemd/system/weaviate.service"
  install -Dm644 "${srcdir}/weaviate.default" "${pkgdir}/etc/default/weaviate"

  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # licenses
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
