# Maintainer: iamzhz <iamzhz at foxmail dot com>
# Contributor: wuziqian211 <wuziqian211 at 126 dot com>

pkgname=tchmaterial-parser
pkgver=3.3.3
pkgrel=1
pkgdesc="国家中小学智慧教育平台 资源下载工具，帮助您从国家中小学智慧教育平台中获取电子课本的 PDF 文件网址并进行下载，让您更方便地获取课本内容。 "
arch=('x86_64')
url="https://github.com/happycola233/tchMaterial-parser"
license=('MIT')
depends=('python' 'tk' 'python-psutil' 'python-requests' 'python-pyperclip' 'python-setuptools' 'python-pypdf')
source=(
        "v$pkgver.tar.gz::https://github.com/happycola233/tchMaterial-parser/archive/refs/tags/v$pkgver.tar.gz"
        "tchMaterial-parser.desktop"
        "setup.py"
)
sha256sums=(
        '1d04493294d9ef65679a7ec2e4daf03133fee59f5e81635162a5c44e5d102a7b'
        'SKIP'
        'SKIP'
)

build() {
  cd "tchMaterial-parser-$pkgver"
  cp "$srcdir/setup.py" .
  cp "$srcdir/tchMaterial-parser.desktop" .
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
  install -Dm644 src/favicon_223x223.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/tchMaterial-parser.png"
}
