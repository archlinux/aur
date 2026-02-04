# Maintainer: Wimpy <vvinn.py[AT]github.com>
pkgname=iflow-cli
pkgver=0.5.6
pkgrel=1
pkgdesc="iFlow AI Assistant CLI tool (@iflow-ai/iflow-cli)"
arch=('any')
url="https://github.com/iflow-ai"
license=('unknown')
depends=('nodejs' 'npm')
provides=('iflow')
conflicts=('iflow')
source=()
sha256sums=()


prepare() {
  cd "$srcdir"
  npm pack @iflow-ai/iflow-cli@$pkgver

  source_file=$(ls -1 *.tgz | head -n 1)

  if [[ -z "$source_file" ]]; then
    echo "错误：未找到下载的 tarball 文件！"
    exit 1
  fi
  
  tar -xzf "$source_file"
}

build() {
  cd "$srcdir/package"
  npm prune --omit=dev
}

package() {
  cd "$srcdir/package"

  mkdir -p "$pkgdir/usr/lib/node_modules/@iflow-ai/"
  cp -r . "$pkgdir/usr/lib/node_modules/@iflow-ai/iflow-cli"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/lib/node_modules/@iflow-ai/iflow-cli/bundle/iflow.js "$pkgdir/usr/bin/iflow"
}
