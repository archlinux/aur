# Maintainer: iamzhz <iamzhz at foxmail dot com>
# Maintainer: wuziqian211 <wuziqian211 at 126 dot com>

pkgname=tchmaterial-parser
pkgver=4.0
pkgrel=1
pkgdesc="国家中小学智慧教育平台 资源下载工具，帮助您从国家中小学智慧教育平台中获取电子课本的 PDF 文件网址并进行下载，让您更方便地获取课本内容。"
arch=('any')
url="https://github.com/happycola233/tchMaterial-parser"
license=('MIT')
depends=('python' 'tk' 'python-pillow' 'python-psutil' 'python-requests' 'python-pyperclip' 'python-pypdf' 'python-sv-ttk')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=(
        "v$pkgver.tar.gz::https://github.com/happycola233/tchMaterial-parser/archive/refs/tags/v$pkgver.tar.gz"
        "tchmaterial-parser.desktop"
)
sha256sums=(
        '45b97363983c497b9e8b4c07c79e0f94265bc12f2fc758ada592006e22b66828'
        'SKIP'
)

build() {
  cd "tchMaterial-parser-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "tchMaterial-parser-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/tchmaterial-parser.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tchmaterial-parser.svg"
}
