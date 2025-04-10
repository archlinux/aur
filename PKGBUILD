# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=yewtube
pkgver=2.12.1
pkgrel=2
pkgdesc="Terminal-based YouTube player and downloader"
arch=(any)
url="https://github.com/mps-youtube/yewtube"
license=(GPL3)
depends=(python-pip python-pylast python-pyperclip python-requests python-ytsp-git yt-dlp)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(7d79a6bfcf2bbd1066ad4fdfef5e5fc7ed1ad912ff495dac213c852153b5f92cfbc4f252a0b947413e90c340ad4d1385179086f62fc1bcb56f59fc04f7145ad4)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/httpx/ s/<.*//' requirements.txt
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
