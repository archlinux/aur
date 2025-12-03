# Maintainer: dvb < echo =oQZk5ibltmcwIGQ4VnbpxGajJXY | rev | base64 -d >
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname=trufflehog
pkgver=3.91.2
pkgrel=1
pkgdesc="Tool for finding secrets like private keys and credentials."
arch=('x86_64')
url="https://github.com/trufflesecurity/trufflehog"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
provides=('trufflehog')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e6d830214e186a82f3f0f4008244003f26ef6234905d2b21c6b7b834f242f65c6731ebbba7ab032ba188612e06b266beee8a2b0044bc3c5605e3f7d102e753bc')

build() {
  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/build" go build -buildmode=pie -ldflags "-linkmode=external -extldflags \"$LDFLAGS\"" -modcacherw -trimpath
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
