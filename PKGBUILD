# Thanks to the maintainer(s) of chirp-daily
# Maintainer: K5TRP <K5TRP@protonmail.com>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ashley Roll (ash@digitalnemesis.com)
# Contributor: Erez Raviv (erezraviv@gmail.com)

pkgname=chirp-next
pkgver=20230207
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from daily build"
arch=('any')
url="https://chirp.danplanet.com"
license=('GPL3')
depends=('python-six' 'python-pyserial' 'python-future' 'python-requests' 'python-suds' 'python-yattag' 'python-wxpython')
optdepends=('hamradio-menus: XDG menus for ham radio software')
options=(!emptydirs)
conflicts=('chirp' 'chirp-daily')
provides=(chirp)
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://trac.chirp.danplanet.com/chirp_next/next-$pkgver/chirp-$pkgver.tar.gz")
# Checksum: https://trac.chirp.danplanet.com/chirp_next/next-$pkgver/SHA1SUM
sha1sums=('b56ec844d8359e67b9fcb3a74fe2ea2ea4052edc')

build() {
  cd "chirp-$pkgver"
  python setup.py build
}

package() {
  cd "chirp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirpw.1" "${pkgdir}/usr/share/man/man1/chirpw.1"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.desktop" "${pkgdir}/usr/share/applications/chirp.desktop"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.png" "${pkgdir}/usr/share/pixmaps/chirp.png"
}
