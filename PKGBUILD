# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname=oilshell
pkgver=0.8.pre1
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
install=oilshell.install
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('d42de21c3076aa7a93ebbe8e2026ea6f9fd4d5097130272365d1e42103f70fea')

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
