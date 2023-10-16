# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=di-tui
pkgver=1.3.27
pkgrel=1
pkgdesc='A simple terminal UI player for di.fm Premium'
url='https://github.com/acaloiaro/di-tui'
license=('BSD')
depends=('pulseaudio')
makedepends=('go')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/acaloiaro/di-tui/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ffc17a61552f47f0f8f6dc9c405df3613cf4daa325791a67e359a3bd5db3e91c07c29ea3f8743e617ed521780ebf520b312ed1a8e00bd1d70c1671721297b3be')

build() {
  export GOPATH="$srcdir"
  cd $pkgname-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
