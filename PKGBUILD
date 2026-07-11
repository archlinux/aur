pkgname=fetchit-git
pkgver=v0.0.2.r1.gce3ad82
pkgrel=1
pkgdesc="A highly concurrent web crawler and markdown extractor"
arch=('x86_64')
url="https://github.com/Aarav90-cpu/fetchIt"
license=('Apache-2.0')
depends=('python-aiohttp' 'python-beautifulsoup4' 'python-markdownify' 'python-tqdm' 'python-lxml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'pybind11')
provides=('fetchit')
conflicts=('fetchit')
source=("fetchIt::git+https://github.com/Aarav90-cpu/fetchIt.git")
md5sums=('SKIP')

pkgver() {
  cd fetchIt
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fetchIt
  python -m build --wheel --no-isolation
}

package() {
  cd fetchIt
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
