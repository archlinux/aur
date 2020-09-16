# Maintainer: Rose Kunkel <rose at rosekunkel dot me>

pkgname=guile3
_pkgname=guile
pkgver=3.0.4
pkgrel=1
pkgdesc='Portable, embeddable Scheme implementation written in C'
arch=('x86_64')
url='https://www.gnu.org/software/guile/'
license=('GPL3')
depends=('gmp' 'libltdl' 'ncurses' 'texinfo' 'libunistring' 'gc' 'libffi' 'readline')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-$pkgver.tar.lz"{,.sig})
sha256sums=('f2b0b66fd72bc24df76856e1549bf327c025b8a5d5fa3cb1696327c5941c89c4'
            'SKIP')
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5') # Ludovic Courtès 

function build {
  cd "${_pkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

function check {
  cd "${_pkgname}-$pkgver"
  make -k check
}

function package {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
}
