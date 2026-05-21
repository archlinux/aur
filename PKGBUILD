# Maintainer: 32archusers <https://github.com/32archusers>
pkgname=web-archer-git
pkgver=r1.1234aef
pkgrel=1
pkgdesc="A bug-fixed, multi-threaded text scraper and website crawling tool."
arch=('any')
url="https://github.com/32archusers/web-archer"
license=('MIT') # ayya open source
depends=(
  'python'
  'python-requests'
  'python-beautifulsoup4'
  'python-curl_cffi'
  'python-ddgs'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('web-archer' 'web-scout')
conflicts=('web-archer' 'web-scout')
source=("git+https://github.com/32archusers/web-archer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/web-archer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/web-archer"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/web-archer"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
