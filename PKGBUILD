# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Based on obs-backgroundremoval PKGBUILD by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval-git
pkgver=v0.5.17.r5.0b68535
pkgrel=1
pkgdesc="Background removal plugin for OBS studio (precompiled onxxruntime, git version, CUDA)"
arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('MIT custom')
depends=('obs-studio' 'opencv')
makedepends=('git' 'cmake')
conflicts=("obs-backgroundremoval")
source=('git+https://github.com/royshil/obs-backgroundremoval.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -B build -DLINUX_PORTABLE=OFF -DUSE_SYSTEM_OPENCV=ON
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cmake --install build --prefix "$pkgdir/usr"
}
