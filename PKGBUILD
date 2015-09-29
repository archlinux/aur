# Maintainer: Stephan Conrad <stephan.conrad@gmail.com>
pkgname=ginger
pkgver=1.3.0.1
pkgrel=3

pkgdesc="HTML5 management for KVM"

arch=(any)

url="https://github.com/kimchi-project/ginger"

license=('LGPL2.1' 'APACHE')

depends=(
  'kimchi'
)



# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/kimchi/kimchi.conf')

source=(
 "https://github.com/kimchi-project/ginger/archive/1.3.0.1-final.tar.gz"
)

md5sums=('2150b504f5df529bccf0314beec841a7')

build() {
  cd "$srcdir/${pkgname}-${pkgver}-final"
#  msg "Patching for python2"
#  patch -p1 -i ../python2.patch
  msg "Running autogen.sh"
  PYTHON=/usr/bin/python2.7 ./autogen.sh --system --localedir=/usr/share/kimchi/plugins/ginger/mo/locale
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-final"
  make DESTDIR=$pkgdir install
}
