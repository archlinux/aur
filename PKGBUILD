# Maintainer: Bastian Rieck <bastian.rieck@bsse.ethz.ch>

pkgname=s3m-git
pkgver=r211.8a3abf5
pkgrel=1
pkgdesc='S3M: Statistically Significant Shapelet Mining'
arch=('x86_64')
url="https://github.com/BorgwardtLab/S3M"
license=('MIT')
groups=()
depends=('boost')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('s3m::git+https://github.com/BorgwardtLab/S3M.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake ../code/cpp -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
	cd "$srcdir/${pkgname%-git}"
  cd build
	./s3m --help
}

package() {
	cd "$srcdir/${pkgname%-git}"
  cd build
	make DESTDIR="$pkgdir/" install
}
