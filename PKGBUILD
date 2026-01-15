# Maintainer: Wimpy <vvinn.py[AT]gmail.com>
pkgname=codebuddy-cli
pkgver=2.34.0 
pkgrel=2
pkgdesc="腾讯AI编程助手 CodeBuddy CLI 工具 (@tencent-ai/codebuddy-code)"
arch=('any')
url="copilot.tencent.com"
license=('unknown')
depends=('nodejs' 'npm')
provides=('tcb' 'codebuddy')
conflicts=('tcb' 'codebuddy')
source=()
sha256sums=()

pkgver() {
  npm view @tencent-ai/codebuddy-code version 2> /dev/null | tr -d "'"
}

prepare() {
  cd "$srcdir"
  npm pack @tencent-ai/codebuddy-code@$pkgver
  source_file=$(ls -1 *.tgz | head -n 1)
  tar -xzf "$source_file"
  mv package "$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm prune --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/node_modules/@tencent-ai/"
  cp -r . "$pkgdir/usr/lib/node_modules/@tencent-ai/codebuddy-code"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/lib/node_modules/@tencent-ai/codebuddy-code/bin/codebuddy "$pkgdir/usr/bin/codebuddy"
}
