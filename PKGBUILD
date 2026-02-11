# Maintainer: KyvYang <kyvyang@foxmail.com>

pkgname=netease-cloud-music-dl-git
pkgver=r53.bffe54d
pkgrel=1
pkgdesc="Netease cloud music song downloader, with full ID3 metadata, eg: front cover image, artist name, album name, song title and so on."
arch=('any')
url="https://github.com/codezjx/netease-cloud-music-dl"
license=('MIT')
depends=('python' 'python-requests>=2.17.3' 'python-pycryptodomex' 'python-mutagen>=1.38.0' 'python-pillow>=12.0.0')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
options=(!emptydirs)
source=("git+https://github.com/codezjx/netease-cloud-music-dl.git")
md5sums=('SKIP')
_gitname=netease-cloud-music-dl

pkgver() {
  cd $srcdir/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_gitname
  python -m build --wheel --no-isolation
}

package(){
  cd $srcdir/$_gitname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
