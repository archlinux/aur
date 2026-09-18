# Maintainer: dvb < echo =oQZk5ibltmcwIGQ4VnbpxGajJXY | rev | base64 -d >
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname=trufflehog
pkgver=3.97.5
pkgrel=1
pkgdesc="Tool for finding secrets like private keys and credentials."
arch=('x86_64')
url="https://github.com/trufflesecurity/trufflehog"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
provides=('trufflehog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bf2e3050ca209c82f42ea1b869b79e5ed37bc4e5fa1482a89fecda84e2c7f78cccae0cc30c11b696f049bcd87baf94371ce5a2fac3bd3c754fb536f4031a0256')

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags \"$LDFLAGS\"" -modcacherw -trimpath
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
