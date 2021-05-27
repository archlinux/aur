# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.10
pkgrel=3
url='https://practical-scheme.net/gauche/'
arch=(x86_64)
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib)
makedepends=(autoconf gauche git)
license=(BSD)
source=("$pkgname::git+https://github.com/shirok/Gauche#commit=d028d2e291957b066572aae4a76dbd7a75a528d7") # tag: release0_9_10
b2sums=(SKIP)

build() {
  cd $pkgname
  export BUILD_GOSH=/usr/bin/gosh
  ./DIST gen
  ./configure --prefix=/usr --with-slib=/usr/share/slib
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  touch -d '17 May 2021 10:10' "$pkgdir"/usr/share/info/gauche-ref*info*.gz
}

# getver: practical-scheme.net/gauche/gmemo/index.cgi?ReleaseNotes
