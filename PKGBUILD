# $Id: PKGBUILD 279427 2016-10-29 14:43:40Z dan $
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=dash-sh
pkgver=0.5.9.1
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
depends=('glibc')
conflicts=('dash' 'bash')
provides=('dash' 'sh')
install=dash-sh.install
source=("http://gondor.apana.org.au/~herbert/dash/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('7b9cb47fc2a007c26fedc99d22a7fc1dc2f5f914')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  ln -sr "${pkgdir}"/usr/bin/{dash,sh}

  # license
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
