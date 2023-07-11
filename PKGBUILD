# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Based on obs-backgroundremoval PKGBUILD by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval-git
pkgver=1.1.0.r2.aeab837
pkgrel=1
pkgdesc="Background removal plugin for OBS studio"
arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl')
makedepends=('git' 'cmake')
conflicts=("obs-backgroundremoval")
source=('git+https://github.com/royshil/obs-backgroundremoval.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -B build --preset linux-x86_64 -DLINUX_PORTABLE=OFF -DUSE_SYSTEM_OPENCV=ON -DUSE_SYSTEM_CURL=ON
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cmake --install build --prefix "$pkgdir/usr"
}
