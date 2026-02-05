# Maintainer: Wimpy <vvinn.py[AT]gmail.com>
pkgname=codebuddy-cli
pkgver=2.47.0
pkgrel=1
pkgdesc="腾讯AI编程助手 CodeBuddy CLI 工具 (@tencent-ai/codebuddy-code)"
arch=('any')
url="copilot.tencent.com"
license=('unknown')
depends=('nodejs' 'npm')
provides=('codebuddy')
conflicts=('codebuddy')
source=()
sha256sums=()


prepare() {
  cd "$srcdir"
  npm pack @tencent-ai/codebuddy-code@$pkgver
  source_file=$(ls -1 *.tgz | head -n 1)
  tar -xzf "$source_file"
}

build() {
  cd "$srcdir/package"
  npm prune --omit=dev
}

package() {
  cd "$srcdir/package"

  mkdir -p "$pkgdir/usr/lib/node_modules/@tencent-ai/"
  cp -r . "$pkgdir/usr/lib/node_modules/@tencent-ai/codebuddy-code"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/lib/node_modules/@tencent-ai/codebuddy-code/bin/codebuddy "$pkgdir/usr/bin/codebuddy"
}
