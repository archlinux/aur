# Contributor:  TDY <tdy@gmx.com>
# Contributor: lswest <lswest34 : gmail>
# Contributor: Christoph Zeiler <rabyte : gmail>

pkgname=gwaei
pkgver=3.6.2
pkgrel=1
pkgdesc="Japanese-English dictionary program"
arch=('i686' 'x86_64')
url="http://gwaei.sourceforge.net/"
license=('GPL3')
depends=('curl' 'dconf' 'gtk3' 'gsettings-desktop-schemas' 'hunspell' 'mecab')
makedepends=('gnome-doc-utils' 'intltool')
optdepends=('rsync: provide incremental dictionary updates'
            'ttf-arphic-ukai'
            'ttf-kanjistrokeorders: show stroke order diagrams')
install=gwaei.install
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/${pkgver/2/x}/$pkgname-$pkgver.tar.xz")
md5sums=('5257b95722d8f935cc47a78c8147716d')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-scrollkeeper  --disable-schemas-install \
      --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
  #glib-compile-schemas "$pkgdir/usr/share/glib-2.0/schemas"
  make DESTDIR=$pkgdir install
  ln -sf $pkgname "$pkgdir/usr/bin/waei"
}
