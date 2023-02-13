# Maintainer: dvb <archlinux at b0rken dot de>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname=trufflehog
pkgver=3.27.1
pkgrel=1
pkgdesc="Tool for finding secrets like private keys and credentials."
arch=('x86_64')
url="https://github.com/trufflesecurity/trufflehog"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
provides=('trufflehog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f158f5ff34ad9019de1aff2cccf8d78893c82053650e40c6348d40e1bf3f52d4b68ca7d6cbfce3e68ca11d5b1b4256144a8c58506faa5f4e9c7164d263307516')

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS" -modcacherw -trimpath
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
