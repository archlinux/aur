# Maintainer: Xynrin <xynrin@163.com>

pkgname=spark-store-tui
pkgver=0.8.3
pkgrel=3
_commit=2608421d1826c3897b165ff6b2e15629c140509e
pkgdesc='Native terminal UI for Spark Store software management'
arch=('x86_64' 'aarch64')
url='https://github.com/Xynrin/spark-store-tui'
license=('GPL-3.0-only')
makedepends=('go')
depends=('ca-certificates' 'amber-package-manager>=1.2.2')
optdepends=(
  'chafa: terminal image previews'
  'sudo: install and uninstall local packages as a non-root user'
)
source=("${pkgname}-${_commit}.tar.gz::https://codeload.github.com/Xynrin/${pkgname}/tar.gz/${_commit}")
sha256sums=('3106eb554728f60918f15757539c73813aa2c267c405d996157d4acb1a2f84c1')

build() {
  cd "${pkgname}-${_commit}"
  CGO_ENABLED=0 go build -trimpath -buildvcs=false -o sparkstore ./cmd/spark-store-tui
}

package() {
  cd "${pkgname}-${_commit}"

  install -Dm755 sparkstore "${pkgdir}/usr/lib/sparkstore/sparkstore"
  install -Dm755 package-root/usr/bin/sparkstore "${pkgdir}/usr/bin/sparkstore"
  ln -s sparkstore "${pkgdir}/usr/bin/SparkStore"
  ln -s sparkstore "${pkgdir}/usr/bin/SPARKSTORE"
  ln -s sparkstore "${pkgdir}/usr/bin/spark-store-tui"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
