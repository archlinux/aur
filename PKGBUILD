# Maintainer: Ruthger Gubbels <aur@ruthger.nl>

pkgname='iksemel'
pkgver=1.5
pkgrel=1
pkgdesc='XML parser library for Jabber applications in ANSI C'
arch=('i686' 'x86_64')
url='https://github.com/meduketto/iksemel'
license=('LGPL')
depends=('glibc')
install='iksemel.install'
source=('git://github.com/meduketto/iksemel')
sha512sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh
  ./configure --prefix=/usr \
        --infodir=/usr/share/info \
        --disable-python
  make
}

package() {
  cd "${srcdir}"/$pkgname
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/share/info/$pkgname "${pkgdir}"/usr/share/info/$pkgname.info
  rm -rf "${pkgdir}"/usr/share/info/dir
}
