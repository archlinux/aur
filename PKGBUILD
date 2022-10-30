# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: William Rea <sillywilly at gmail dot com>

pkgname=mftrace
pkgver=1.2.20
pkgrel=4
pkgdesc="Traces TeX bitmap fonts into PFA, PFB, or TTF"
arch=('x86_64')
url="http://lilypond.org/mftrace/"
license=('GPL2')
depends=('glibc' 'potrace' 'python' 't1utils' 'texlive-bin'
'texlive-fontsextra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanwen/${pkgname}/archive/release/${pkgver}.tar.gz")
sha512sums=('f5a6ee531c63a023d4c2629d1b0138340225ee5d5af5422d682bf89a7eb156f74f045c7be4186d507355602487672dd7ffb3674d515e94ef4b8b48c32481cdd3')
b2sums=('9c655823bac16fa51fe14fe7076604d999e972b62cf21277f6435f566f33c4a29e1019ffefbfeb3b5c4daa57d5409f19dfbeab4935247603f201a433d1f00ba1')

prepare() {
  mv -v "${pkgname}-release-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 {ChangeLog,README.texi} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
