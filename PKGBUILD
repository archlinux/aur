# Maintainer: Ian Liu Rodrigues <ian dot liu88 at gmail dot com>
pkgname=aws-asl-languageserver
pkgver=1.67.0
pkgrel=1
pkgdesc="Language server for AWS Step Function's ASL, extracted from aws-toolkit-vscode"
arch=('any')
url=https://github.com/aws/aws-toolkit-vscode
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aws/aws-toolkit-vscode/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")

prepare() {
  cd "aws-toolkit-vscode-$pkgver"
  npm install
}

build() {
  cd "aws-toolkit-vscode-$pkgver"
  npm run vscode:prepublish || true
}

package() {
  cd "aws-toolkit-vscode-$pkgver"
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm 755 dist/src/stepFunctions/asl/aslServer.js "$pkgdir"/usr/bin/aws-asl-languageserver
  sed -i '1s|^|#!/usr/bin/node\n|' "$pkgdir"/usr/bin/aws-asl-languageserver
}
