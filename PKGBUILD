# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.55
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://yash.osdn.jp'
license=('GPL')
depends=('ncurses')
makedepends=('asciidoc' 'ed')
options=('lto')
install="${pkgname}.install"
source=("https://github.com/magicant/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('9f5ac033bdc5fd49b98552ecde144f180a6148394a1d6cb1b33823a8f4440637'
            'c66c7a4b9da4416082ea57bbec0ce0c2bbc13af340ceb1241b4a4897d8944531')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-array \
    --enable-dirstack \
    --enable-double-bracket \
    --enable-help \
    --enable-history \
    --enable-lineedit \
    --enable-nls \
    --enable-printf \
    --enable-socket \
    --enable-test \
    --enable-ulimit

  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/* "${pkgdir}/usr/share/doc/${pkgname}"
}
