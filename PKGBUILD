# Maintainer: aksr <aksr at t-com dot me>
pkgname=exhal-git
pkgver=1.21b.r53.44affc7
pkgrel=1
epoch=
pkgdesc="Compression and decompression tools for NES, SNES, and Game Boy games by HAL Laboratory"
arch=('i686' 'x86_64')
url="https://github.com/devinacker/exhal"
license=('MIT')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/devinacker/exhal.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 exhal $pkgdir/usr/bin/exhal
  install -Dm755 inhal $pkgdir/usr/bin/inhal
  install -Dm644 README.txt $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

