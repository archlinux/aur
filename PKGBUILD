pkgname=pomo
pkgver=0.8.1
pkgrel=1

pkgdesc='Pomodoro Command Line Interface'
url='https://kevinschoon.github.io/pomo/'
arch=(x86_64 aarch64)
license=(MIT)

#epends=()
makedepends=('go')


source=("https://github.com/kevinschoon/pomo/archive/${pkgver}.tar.gz")
build() {
	cd ${pkgname}-${pkgver}
  #export GOOS=linux
  #export GOARCH=arm64
  #export BUILD_NUMBER=1
  export BUILD_VERSION=${pkgver}
  make bin/pomo
}

package() {
  mkdir -p $pkgdir/usr/bin
  gzip -f -k $srcdir/${pkgname}-${pkgver}/man/pomo.1
  install -Dm 755 $srcdir/${pkgname}-${pkgver}/bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 $srcdir/${pkgname}-${pkgver}/man/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}

md5sums=('d6f1d5661ccf0485d02d73f93138d221')
sha512sums=('53b9608efce6a0820fc9fa3bfb9af406c23f1457bba2113c83b2fe714bff6e6e4d956533691ba7de8ada4db38a37527bed47692524128d275be3ec9a8b9bf758')
