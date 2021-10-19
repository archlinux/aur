# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=outguess
pkgver=0.4
pkgrel=1
pkgdesc="A universal steganographic tool"
arch=('i686' 'x86_64')
url="https://github.com/resurrecting-open-source-projects/outguess"
license=('BSD')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1279b05f3bb5e8956c6eb424db247e773440898310c10dbf9571e7b6afae5d60')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --with-generic-jconfig
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 README.md ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
}
