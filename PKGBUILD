# Maintainer: Hans-Nikolai Viessmann <hans AT viess DO mn>

pkgname=oilshell
pkgver=0.8.6
pkgrel=1
pkgdesc='Oil, a new unix shell'
arch=('x86_64')
url='http://www.oilshell.org/'
depends=('readline')
license=('APACHE')
options=(!strip)
install=oilshell.install
source=("https://www.oilshell.org/download/oil-${pkgver}.tar.xz")
sha256sums=('7d7d66888f325f39ff4fd71b6d9ffb13afed2ecdd15ec5f73e07c2eec0712235')

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
  install -Dm644 doc/osh.1 "$pkgdir/usr/share/man/man1/osh.1"
}
