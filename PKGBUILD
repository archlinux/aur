# Maintainer: ploxiln <pierce.lopez@gmail.com>

pkgname=mbrowse
pkgver=0.4.3
pkgrel=6
pkgdesc='A graphical SNMP MIB browser based on GTK+ and Net-SNMP'
arch=('i686' 'x86_64')
license=('GPL')
url='https://sourceforge.net/projects/mbrowse/'
depends=('gtk2' 'net-snmp')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "bookmark_items.patch"
        "configuration_strncpy.patch"
        "search_oid_length.patch")
sha256sums=('735a86a027659d3be39723d554758d6b51cce56ef3807efd5123d48ebf41506e'
            'a6aad6155b9042d3f05a6d40fcb296d393fc84f036a6c73466ecd0f5183cb0de'
            'ee3788fe3c127e3aae42fe5ceefdb8437b7b859a313d10ef3f9e604015af0473'
            'a2fdcc3252bcec42f7386a14a49b58017c932530be682335e0c10244a696d806')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 <$srcdir/bookmark_items.patch
  patch -p1 <$srcdir/configuration_strncpy.patch
  patch -p1 <$srcdir/search_oid_length.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
