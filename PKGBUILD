# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.9
pkgrel=2
url='https://practical-scheme.net/gauche/'
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib)
makedepends=(autoconf gauche git)
license=(BSD)
arch=(x86_64)
# gauche tag: release0_9_9
source=("git+https://github.com/shirok/Gauche#commit=b9a861bdbc354cf5a357fe0b2cfc05e7cbd99ab9")
sha256sums=('SKIP')

build() {
  cd Gauche
  export BUILD_GOSH=/usr/bin/gosh
  ./DIST gen
  ./configure --prefix=/usr --with-slib=/usr/share/slib
  make
}

package() {
  cd Gauche
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# getver: practical-scheme.net/gauche/gmemo/index.cgi?ReleaseNotes
# vim: ts=2 sw=2 et:
