# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mldonkey
pkgver=3.1.7
pkgrel=1
pkgdesc='A multi-network P2P client'
arch=(x86_64)
url='http://mldonkey.sourceforge.net/'
license=(GPL)
depends=(file gd hicolor-icon-theme miniupnpc libnatpmp libminiupnpc.so)
makedepends=(gtk2 librsvg ocaml-num camlp4 lablgtk2)
optdepends=('librsvg: GUI support'
            'gtk2: GUI support')
backup=(etc/conf.d/mldonkey)
source=(https://github.com/ygrek/mldonkey/releases/download/release-${pkgver//./-}/mldonkey-$pkgver.tar.bz2{,.asc}
        mldonkey.conf
        mldonkey.service
        mldonkey.tmpfiles
        mldonkey.sysusers)
sha256sums=('cfdd69a4f4db0dff704aab9dde27f9bac4836ad593f8393700f8ed7970ca5106'
            'SKIP'
            'f1d9401cefd591662d49011c53fdb2788755a6f745a963e46d8037b990edeb6a'
            '778cebe8edcffd63db3594054c2daa62ce571644a96ad235b8c95470b55c0415'
            '9c78fbfbba4f8286e2c2299e4da6f76d0f34f33fde26964922707c34fb75157b'
            '24d7ef8f6af93a8d87a82842b0ed796e35ce2f88d81734d9275eede8f4e10fba')
validpgpkeys=(A34C49DD3DB8B78DFAEBE0FA6346B945708D5A0C)

build() {
  cd mldonkey-$pkgver
  ./configure --prefix=/usr --enable-gui=newgui2 --enable-upnp-natpmp --enable-batch
  make
}

package() {
  cd mldonkey-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 packages/rpm/mldonkey-icon-16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/mldonkey.png
  install -Dm644 packages/rpm/mldonkey-icon-48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/mldonkey.png
  install -Dm644 distrib/mldonkey.desktop "$pkgdir"/usr/share/applications/mldonkey.desktop

  install -Dm644 "$srcdir"/mldonkey.conf "$pkgdir"/etc/conf.d/mldonkey
  install -Dm644 "$srcdir"/mldonkey.service "$pkgdir"/usr/lib/systemd/system/mldonkey.service
  install -Dm644 "$srcdir"/mldonkey.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/mldonkey.conf
  install -Dm644 "$srcdir"/mldonkey.sysusers "$pkgdir"/usr/lib/sysusers.d/mldonkey.conf
}
