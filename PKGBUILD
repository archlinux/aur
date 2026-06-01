# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=yewtube
pkgver=2.13.1
pkgrel=1
pkgdesc="Terminal-based YouTube player and downloader"
arch=(any)
url="https://github.com/mps-youtube/yewtube"
license=(GPL3)
depends=(python-pip python-pylast python-pyperclip python-requests python-ytsp-git yt-dlp)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(9f33ea593cf51650358bcbab3f421537cea8ba800f8c323d809d93c8b74dc7381157d19208cc4f1e56310a7a70c11cb11f3098af4711dc34cc8822cbc64580fd)

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
