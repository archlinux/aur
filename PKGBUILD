pkgname=yay-faster-cn
pkgver=0.11
pkgrel="2"
pkgdesc="Use github mirror to speed yay up in China."
arch=('any')
url="https://github.com/iamzhz/yay-faster-cn"
license=('MIT')


depends=('python' 'python-setuptools' 'git' 'wget' 'yay')
makedepends=('python-setuptools')


source=("https://github.com/iamzhz/yay-faster-cn/releases/download/v${pkgver}/yay_faster_cn_v${pkgver}.tar.gz")
sha256sums=('1cae0f846fbf2ddbb22efcec735cf0dc01e04620c873a29338bb8e3b2948bb3b')

build() {
  cd "yay_faster_cn_v$pkgver"  # 匹配压缩包内的目录名
  python -m build --wheel --no-isolation
}

package() {
  cd "yay_faster_cn_v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}