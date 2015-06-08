# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=avp
pkgver=20150214
pkgrel=1
pkgdesc="Alien Versus Predator Gold engine"
arch=(i686 x86_64)
url="https://www.icculus.org/avp"
license=('custom')
depends=('sdl' 'libgl' 'openal')
makedepends=('cmake' 'glu')
optdepends=('avp-data')
install='avp.install'
source=("${url}/files/${pkgname}-${pkgver}.tar.gz"
        "avp")
sha512sums=('c485a55ff455498bcf82bc17f2056d35d4c646bdf7809f4c326fc7063a9ce5db9e4893af67dff3f6bedb7d5f96e82f792d7f516044fdbab638113091a5505158'
            'b9d2923123e6ecc8703ed15e7df170ec5a8607d444800434887ec540aba51b7dc5e39f56b511584560ffab7b9c04db7e24d820b6f1fab30f8b95f332a4a176b1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install binary
  install -D -m755 "avp" "$pkgdir/opt/avp/avp"
  install -D -m755 "$srcdir/avp" "$pkgdir/usr/bin/avp"

  # install readme
  install -D -m644 "README" "$pkgdir/opt/$pkgname/README"

  # install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # symlink binary to /usr/bin
}
