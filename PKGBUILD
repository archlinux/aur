# Maintainer: Stefan Haller <fgrsnau@gmail.com>
pkgname=blkdevsync-git
pkgver=0.1.20200607
pkgrel=1
pkgdesc="Synchronize block devices by writting only changed blocks"
arch=('x86_64')
url="https://github.com/fgrsnau/blkdevsync"
license=('MIT')
makedepends=('git' 'rust')
source=('blkdevsync::git+https://github.com/fgrsnau/blkdevsync')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf '0.1.%s\n' "$(git log -n1 --pretty=format:%ai | cut -d' ' -f1 | tr -d '-')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 target/release/blkdevsync -t "${pkgdir}/usr/bin"
}
