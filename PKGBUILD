# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=caire
pkgver=1.6.1
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
provides=("${pkgname}")
depends=('libxcursor' 'libxfixes' 'libxkbcommon' 'glibc' 'wayland' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libglvnd')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('caad6520cc42a17216d5cd95f18cb778d42844468cfb1405e5bee71d36f023c6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=${pkgver}" \
    -o "$pkgname" \
    cmd/caire/*.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
