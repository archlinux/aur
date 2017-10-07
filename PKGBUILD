# Maintainer: kevku <kevku@gmx.com>
pkgname=esteidfirefoxplugin
pkgver=3.12.1.1142
pkgrel=2
pkgdesc="Firefox legacy NPAPI ID card signing plugin."
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('gtk2' 'esteidpkcs11loader' 'openssl-1.0')
source=("https://installer.id.ee/media/ubuntu/pool/main/e/$pkgname/${pkgname}_$pkgver.orig.tar.xz" "openssl-1.0.patch")
sha256sums=('dd01cbfdf820999a2af1959113bf80dd5a8c19a597173672b900e41e7a2ae778'
            'b47d20753d7128a001aa93d2b339f034bacfd9ca3a5b1095547e283aa1e510b2')
validpgpkeys=('43650273CE9516880D7EB581B339B36D592073D4')

prepare(){
    cd "$srcdir/"
    patch -p0 -i "$srcdir/openssl-1.0.patch"
}

build() {
  cd "$srcdir/"
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  make plugin
}

package() {
  cd "$srcdir/"
  install -D npesteid-firefox-plugin.so $pkgdir/usr/lib/mozilla/plugins/npesteid-firefox-plugin.so
}

