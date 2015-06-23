# Maintainer: gandalf3 <zzyxpaw at (@) gmail dot (.) com>

pkgname=scrot-no-beep
pkgver=0.8
pkgrel=1
pkgdesc="A patched version of scrot which does not beep when capturing the screen"
arch=('i686' 'x86_64')
url="http://scrot.sourcearchive.com/"
license=('MIT')
conflicts=('scrot')
provides=('scrot')
depends=('giblib')
source=("http://linuxbrit.co.uk/downloads/scrot-${pkgver}.tar.gz" 'main.patch')
md5sums=('ccae904d225609571bdd3b03445c1e88' '6455143a83f0ebd38e5aad6d15fb589a')

build() {
  cd "${srcdir}/scrot-$pkgver"
  patch -p1 -i "${srcdir}/main.patch"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/scrot-${pkgver}"

  make DESTDIR="${pkgdir}" docsdir="/usr/share/doc/scrot" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}