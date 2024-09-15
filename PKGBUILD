# Maintainer:  Jan Kohnert <bughunter@jan-kohnert.de>

pkgname=astromatic-missfits
_pkgname=missfits
pkgver=2.8.0
pkgrel=3
pkgdesc="manipulates astronomical fits files"
url="http://www.astromatic.net/software/missfits"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=("glibc")
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/astromatic/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  "${_pkgname}-${pkgver}.patch"
)
sha512sums=(
  "1e9e517f1d6fd39140eb5eaddde500ed1d386d322540667d14c2490f7a64e202fb3da11214a6123fd4e29cc5562448721e0acce530ed16ee827a9edccb9bda2f"
  "a1b5fa6326c16d469cd92d459a4acc1f2fac86b9529b278897c1106d6ae71928c610bb180ee99c3d1b8c4e68bf38bde04753425ab8c2e6e3538111108a445cac"
)

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  patch -p1 -i "../${_pkgname}-${pkgver}.patch"
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

