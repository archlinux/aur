# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=clp
pkgver=0.4.0
pkgrel=1
pkgdesc='writes input files to stdout with syntax highlighting'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~eskin/clp"
license=('custom')
depends=('luajit' 'lua51-lpeg' 'lua51-luautf8')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~eskin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8e3b7d77ab588c4df6630713e5de9d5bd3a167f3ad7eeed377f9f7e189489c1b')
conflicts=("${pkgname}-git")

build() {
  cd "${pkgname}-v${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-v${pkgver}"
  make MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
