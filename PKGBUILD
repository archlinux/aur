pkgname=tchmaterial-parser
pkgver=3.2
pkgrel=1
maintainer=('iamzhz' 'wuziqian211')
pkgdesc="国家中小学智慧教育平台 电子课本下载工具，帮助您从智慧教育平台中获取电子课本的 PDF 文件网址并进行下载，让您更方便地获取课本内容。 "
arch=('x86_64')
url="https://github.com/happycola233/tchMaterial-parser"
license=('MIT')
depends=('python' 'tk' 'python-psutil' 'python-requests' 'python-pyperclip' 'desktop-file-utils')
makedepends=('python-setuptools')
source=(
        "v$pkgver.tar.gz::https://github.com/happycola233/tchMaterial-parser/archive/refs/tags/v$pkgver.tar.gz"
        "tchMaterial-parser.desktop"
        "setup.py"
)
sha256sums=(
        '7276e898ab194007d005026d0cdba466489cb26c5cbb1e67298bdbc424047f58'
        'SKIP'
        'SKIP'
)

build() {
  cd "tchMaterial-parser-$pkgver"
  cp ../../setup.py .
  cp ../../*.desktop .
  mv src/tchMaterial-parser.pyw src/main.py
  touch src/__init__.py
  python setup.py build
}

package() {
  cd "tchMaterial-parser-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # 安装额外文件
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 tchMaterial-parser.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 src/favicon_223x223.png "$pkgdir/usr/share/pixmaps/tchMaterial-parser.png"
}
