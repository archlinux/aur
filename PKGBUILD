# Maintainer: Xynrin <xynrin@163.com>

pkgname=spark-store-tui
pkgver=0.8.1
pkgrel=1
pkgdesc='Native terminal UI for Spark Store software management'
arch=('x86_64' 'aarch64')
url='https://github.com/Xynrin/spark-store-tui'
license=('GPL-3.0-only')
makedepends=('go')
depends=('ca-certificates')
optdepends=(
  'chafa: terminal image previews'
  'sudo: install and uninstall local packages as a non-root user'
)
source=("https://github.com/Xynrin/${pkgname}/releases/download/v${pkgver}/${pkgname}-source-${pkgver}.tar.gz")
sha256sums=('cb4ff63b14d4b4e6a0232ff6392389faf212a903a877a68ef51ea00fa2038236')

build() {
  cd "${pkgname}-source-${pkgver}"
  CGO_ENABLED=0 go build -buildvcs=false -o sparkstore ./cmd/spark-store-tui
}

package() {
  cd "${pkgname}-source-${pkgver}"

  install -Dm755 sparkstore "${pkgdir}/usr/lib/sparkstore/sparkstore"
  install -Dm755 package-root/usr/bin/sparkstore "${pkgdir}/usr/bin/sparkstore"
  ln -s sparkstore "${pkgdir}/usr/bin/SparkStore"
  ln -s sparkstore "${pkgdir}/usr/bin/SPARKSTORE"
  ln -s sparkstore "${pkgdir}/usr/bin/spark-store-tui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
