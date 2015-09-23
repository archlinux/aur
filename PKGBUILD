# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=ntch
pkgver=1.0.2.8
_sfver=60442
pkgrel=1
pkgdesc="A console-based 2channel browser"
url="http://sourceforge.jp/projects/ntch/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gdbm' 'ncurses' 'openssl' 'sqlite' 'zlib')
_mirror="jaist" # "jaist" "iij" "osdn" "keihanna"
source=("http://${_mirror}.dl.sourceforge.jp/ntch/${_sfver}/ntch-${pkgver}.tgz")

prepare() {
  cd "${srcdir}/ntch-${pkgver}/src"
  sed -i 's/ncursesw\///' main.c
  cd "${srcdir}/ntch-${pkgver}/src/ui"
  sed -i 's/ncursesw\///' *.c
}

build() {
  cd "${srcdir}/ntch-${pkgver}"
  
  ./configure
  make
}

package() {
  cd "${srcdir}/ntch-${pkgver}"

  install -dm755 "${pkgdir}/usr/bin"
  install -m755 ntch "${pkgdir}/usr/bin"
}

md5sums=('04913fbd68ec330abd370716c2c43755')
