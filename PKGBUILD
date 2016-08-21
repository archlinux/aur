# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=c-pluff
pkgver=0.1.4
pkgrel=1
pkgdesc="A plug-in framework for C programs that has been strongly inspired by the Java plug-in framework in Eclipse."
arch=('i686' 'x86_64')
url="http://www.c-pluff.org/"
license=('MIT')
depends=('expat')
source=("http://www.c-pluff.org/downloads/cpluff-${pkgver}.tar.gz")
sha512sums=('5a3f0a1c7f0a92d4aa404a77a48597c7b09d79cf1a5a428e480aa8d2d5b3f3477b1f2297b3938fd6600ebb937c43588eb1ced266df1b186281ab0799a2d764f6')

build() {
  cd "${srcdir}/cpluff-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/cpluff-${pkgver}"

  make
  make examples
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" examples-install

  install -dm775 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 COPYRIGHT.txt "${pkgdir}"/usr/share/licenses/${pkgname}
}

