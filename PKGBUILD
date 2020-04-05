# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lha
pkgver=1.14i
pkgrel=1
epoch=1
pkgdesc="A compression and archive utility for LH-7 format archives"
arch=('x86_64')
url='http://lha.osdn.jp'
license=('custom:lha')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/jca02266/lha.git#commit=7c3cd95fdf0d2f9198bb779561724cd314bc39a6"
        'LICENSE'
        )
sha256sums=('SKIP'
            'c88f52b7b6b223d1347c6721c24b63ba947baa1756e3713e1fff220e974b9120'
            )

prepare() {
  mkdir -p build
}

build() {
  cd lha
  autoreconf -vfi

  cd ../build
  ../lha/configure \
    --prefix=/usr

    make

}

check() {
  make -C build check
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
