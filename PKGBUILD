# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Trengrove <john at weaviate dot-symbol io>
# Contributor: tee < teeaur at duck dot com >

pkgname=weaviate-bin
pkgver=1.39.0
pkgrel=1
pkgdesc='An open source vector database written in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/weaviate/weaviate'
license=('BSD-3-Clause')
conflicts=('weaviate')
provides=('weaviate')
depends=('glibc')
source=("weaviate.default"
        "weaviate.service"
        "weaviate.sysusers"
        "weaviate.tmpfiles")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/weaviate-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/weaviate-v$pkgver-linux-arm64.tar.gz")

sha256sums=('a375b1c55be48563ea3284a264352f1673c3f8e8f83bfd337c2ddfaeb532ce6d'
            '1507f4003ed6d3d5230cc9570e6f69c3be6177b52496b976f10a93519626b86a'
            'a644fc4eaa46e97381df09b5321e60a9ca1cfdac67277b8fe103fb4bd96d4fa0'
            '557f6c52ca3c4dc261a5ff11e4d998b9f66690c8ee2075450a2a225107b58f57')
sha256sums_x86_64=('cf752fdc3fa34b77c0de82f4c349c2443bff5e05f0d20135297d95da837030dd')
sha256sums_aarch64=('96da481b1b652c4b11f3b72d84e538fc465d58ee16b0753698d909187bc1733a')

package() {
  # binary
  install -Dm755 weaviate -t "${pkgdir}/usr/bin/"

  # user/group & owned directories
  install -Dm644 weaviate.sysusers "${pkgdir}/usr/lib/sysusers.d/weaviate.conf"
  install -Dm644 weaviate.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/weaviate.conf"

  # services & runtime
  install -Dm644 weaviate.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 weaviate.default "${pkgdir}/etc/default/weaviate"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

  # licenses
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
