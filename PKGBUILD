pkgname=pomo
pkgver=0.8.2
pkgrel=1

pkgdesc='Pomodoro Command Line Interface'
url='https://codeberg.org/kevinschoon/pomo'
arch=(x86_64 aarch64)
license=(MIT)

#epends=()
makedepends=('go')


source=("https://codeberg.org/kevinschoon/pomo/archive/${pkgver}.tar.gz")
build() {
	cd ${pkgname}
  #export GOOS=linux
  #export GOARCH=arm64
  #export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make bin/pomo
}

package() {
  mkdir -p $pkgdir/usr/bin
  gzip -f -k $srcdir/${pkgname}/man/pomo.1
  install -Dm 755 $srcdir/${pkgname}/bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 $srcdir/${pkgname}/man/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}

sha512sums=('ceae02d1cc324bd456e176d966eba3bd6822692c53d51b1683ef09791dd5729f650eb8fbaecffd1b8e69f9cd6ca66837abe747540a22c9d5e5abd9a26fa2775d')
