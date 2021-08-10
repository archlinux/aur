# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libiphb
pkgver=1.2.7
_commit_dbus_glib="d42176ae4763e5288ef37ea314fe58387faf2005"
pkgrel=1
pkgdesc="Interface to IP heartbeat service."
url="https://git.sailfishos.org/mer-core/libiphb"
arch=(any)
license=(GPL)
depends=('mce-dev>=1.28') 
makedepends=()
checkdepends=()
groups=(gnome)
source=("git+$url.git#tag=$pkgver"
        "https://github.com/sailfishos-mirror/dbus-glib/archive/$_commit_dbus_glib/dbus-glib-$_commit_dbus_glib.tar.gz")
sha256sums=('SKIP'
            'f4c28d4740ac90863082e81c869e5178d25238b179747984faf0509e40d1afef')

prepare() {
  cd $pkgname
  rm -rf dbus-gmain
  mv "$srcdir/dbus-glib-$_commit_dbus_glib" dbus-gmain
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  libtool --finish /usr/lib
}
