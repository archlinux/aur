# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=yash
pkgver=2.54
pkgrel=1
pkgdesc='Yet Another SHell is a POSIX-compliant command line shell'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://yash.osdn.jp'
license=('GPL')
depends=('ncurses')
makedepends=('ed')
options=('lto')
install="${pkgname}.install"
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
sha256sums=('44a0ac1ccf7c3acecfbea027d8c0c930f13a828065be318055ce113015391839'
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
