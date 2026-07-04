# Maintainer: iamzhz <iamzhz at foxmail dot com>
# Contributor: wuziqian211 <wuziqian211 at 126 dot com>

pkgname=tchmaterial-parser
pkgver=3.3.4
pkgrel=1
pkgdesc="国家中小学智慧教育平台 资源下载工具，帮助您从国家中小学智慧教育平台中获取电子课本的 PDF 文件网址并进行下载，让您更方便地获取课本内容。"
arch=('any')
url="https://github.com/happycola233/tchMaterial-parser"
license=('MIT')
depends=('python' 'tk' 'python-psutil' 'python-requests' 'python-pyperclip' 'python-pypdf')
source=(
        "v$pkgver.tar.gz::https://github.com/happycola233/tchMaterial-parser/archive/refs/tags/v$pkgver.tar.gz"
        "tchMaterial-parser.desktop"
)
sha256sums=(
        'b852cd30c237de2d11dc8cb01c8a6d480e044e9f049e00b7500f8243f047dba3'
        'SKIP'
)

package() {
  cd "tchMaterial-parser-$pkgver"

  # 复制原始脚本并插入 shebang，确保系统能直接识别为 Python 可执行文件
  cp src/tchMaterial-parser.pyw src/tchMaterial-parser
  sed -i '1i\#!/usr/bin/python3' src/tchMaterial-parser
  # 复制文件
  install -Dm755 src/tchMaterial-parser -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir/tchMaterial-parser.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 src/favicon_223x223.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/tchMaterial-parser.png"
}
