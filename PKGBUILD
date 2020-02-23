# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=oilshell
pkgver=0.7.0
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
install=oilshell.install
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('a37eb491ffee5766aa8719056d42d5d836309dc26e345ecd6a2a1d240cd18989')

build() {
  cd "oil-$pkgver"
  ./configure --prefix=/usr --with-readline
  make
}

package() {
  cd "oil-$pkgver"

  # the install script doesn't support DESTDIR
  install -Dm755 _bin/oil.ovm "$pkgdir/usr/bin/oil.ovm"
  ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/osh"
  ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/oshc"
  ln -s /usr/bin/oil.ovm "$pkgdir/usr/bin/oil"

  # install manpage
  install -d "$pkgdir/usr/share/man/man1"
  gunzip -fc doc/osh.1 > "$pkgdir/usr/share/man/man1/osh.1.gz"
}
