# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=irccat
pkgver=0.4.5
pkgrel=3
pkgdesc='cat to IRC'
arch=('x86_64')
url="https://github.com/irccloud/irccat"
license=('GPL')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" irccat.service)
sha256sums=('2457519704d6c22ac1a4aeca123bd44cdd6a6b47bd2e756c558d8c1b115fec0a'
            '379eb5beb3b5df39af8257244a1f4c01e2f6d9020ead34334ce9c6664d05c6a9')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $srcdir/irccat.service "$pkgdir"/usr/lib/systemd/system/irccat.service
}
