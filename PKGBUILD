# Maintainer: Paul Clark <paul500clark@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Israel Herraiz <isra@herraiz.org>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=mpop-gnome
pkgver=1.4.10
pkgrel=1
pkgdesc="A small, fast POP3 client with GNOME Keyring support"
arch=('x86_64')
url="https://marlam.de/mpop/"
license=('GPL3')
depends=('gnutls' 'libsecret')
provides=('mpop')
conflicts=('mpop')
replaces=('mpop')
install=$pkgname.install
source=("https://marlam.de/mpop/releases/mpop-$pkgver.tar.xz"{,.sig})
sha256sums=('9e9b6523f08df50a3d3eec75d94d4c0104ee016c0c913baaf8fbf178bf828388'
            'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')
              # Martin Lambers <marlam@marlam.de>

build() {
  cd "$srcdir/mpop-$pkgver"

  ./configure --prefix=/usr --with-ssl=gnutls --with-libsecret
  make
}

package() {
  cd "$srcdir/mpop-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 doc/mpoprc.example "$pkgdir/usr/share/mpop/mpoprc.example"
}
