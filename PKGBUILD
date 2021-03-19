# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=gdu
pkgver=4.8.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu-git gdu-bin)
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('67c3ee6b08f8c65751cff42dbac4f3365d862517c5bb5851f62949b6f038b121')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p dist/
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 dist/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

