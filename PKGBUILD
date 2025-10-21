# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=karlyriceditor
pkgver=4.1.2
pkgrel=1
pkgdesc="A program which lets you edit and synchronize lyrics with karaoke songs in various formats."
arch=('i686' 'x86_64')
url="https://github.com/gyunaev/karlyriceditor"
license=('GPL-1.0-or-later')
depends=('qt6-base' 'desktop-file-utils' 'gstreamer' 'qt6-multimedia-gstreamer')
source=("karlyriceditor-$pkgver.tar.gz::https://github.com/gyunaev/karlyriceditor/archive/$pkgver.tar.gz" "missing_header.patch")
sha512sums=('e4a253cb785cb7bdbe73390dd25ad2769571a3df6c1a679e59f865ca50c78f09abe6a969abd7010b2046ab349a1a8b34284a567008187323f4f8e60df4455251'
            '4641076fc42b89521f9459b359f4cbda135e949cba4ebab68a03c7b9c2e7082790927f5c4943b7d030fb75bbd4e276db4206db0c54d1f6c76009013c9c182f39')
install=$pkgname.install

prepare() {
  cd karlyriceditor-$pkgver
  patch -Np1 -i ../missing_header.patch
}

build() {
  cd karlyriceditor-$pkgver
  qmake6 \
    PREFIX="${pkgdir}/usr" \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd karlyriceditor-$pkgver
  install -Dm755 bin/karlyriceditor $pkgdir/usr/bin/karlyriceditor
  install -Dm644 packages/karlyriceditor.desktop $pkgdir/usr/share/applications/karlyriceditor.desktop
  install -Dm644 packages/karlyriceditor.png     $pkgdir/usr/share/pixmaps/karlyriceditor.png
}
