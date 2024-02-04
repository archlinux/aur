# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sift
pkgver=0.9.0
pkgrel=2
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64')
url="http://sift-tool.org/"
license=('GPL3')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
conflicts=('sift-bin')
replaces=('sift-bin')
provides=("sift=${pkgver}")
source=("https://github.com/svent/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bbbd5c472c36b78896cd7ae673749d3943621a6d5523d47973ed2fc6800ae4c8')
_gourl="github.com/svent/${pkgname}@v${pkgver}"

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod init github.com/svent/$pkgname
  go mod tidy
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  go build -v -o build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 build/sift $pkgdir/usr/bin/$pkgname
  install -Dm 644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
