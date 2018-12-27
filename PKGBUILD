# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxwell "Synthead" Pray <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog@fergofrog.com>

pkgname=razercfg
pkgver=0.40
pkgrel=2
pkgdesc='Razer mouse configuration tool'
arch=('x86_64')
url=https://bues.ch/h/razercfg
license=('GPL')
depends=('libusb' 'python')
makedepends=('cmake')
optdepends=('python-pyqt5: for the graphical qrazercfg tool')
backup=('etc/razer.conf')
source=("http://bues.ch/razercfg/razercfg-$pkgver.tar.bz2"{,.asc}
        'tmpfile.conf')
sha512sums=('42c3e7a34a348982fb2c1022c85dd3ec6d875dec387492eb4f6aece82423a1fd5984c4efb79926084aac880944a9e139a424487ab277d8c1a56c4f9c0a7c9d6e'
            'SKIP'
            '0a84cf5775930ff9adca513971a9eaf983f239b4cf59f8915632477c6ca20c02997fed3a24864aa04058d66899da3599d92a2180cfc43676102b733dd1db577b')
validpgpkeys=('757FAB7CED1814AE15B4836E5FB027474203454C') # Michael Busch

build() {
  cd razercfg-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd razercfg-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir"/etc razer.conf
  install -Dm644 "$srcdir"/tmpfile.conf\
    "$pkgdir"/usr/lib/tmpfiles.d/razerd.conf
}

# vim:set ts=2 sw=2 et:
