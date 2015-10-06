# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=dbeaver
pkgver=3.5.1
pkgrel=1
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL2")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
#makedepends=('unzip')
install=dbeaver.install

source=(dbeaver.desktop dbeaver.install)
source_i686=("http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86.tar.gz")
source_x86_64=("http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz")
noextract=("dbeaver-ce-latest-linux.gtk.x86.tar.gz"
           "dbeaver-ce-latest-linux.gtk.x86_64.tar.gz")

sha256sums=('cf1e850dcb3544507eeb59b8d2e84b67cd25b546e3eaf03a0ab27ca841361478'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('a0605558bc6a6f8fe14c51ec9fa4042b67d864e73c2401143a08cff6eae26642')
sha256sums_x86_64=('546c4dbf9abe30bcecf6007c65de280e532e2eb18f146120aa6f34ecd31fb357')

prepare() {
  mkdir -p $srcdir/$pkgname
  cd $srcdir/$pkgname
  if [ "$CARCH" = "x86_64" ]; then
    tar -xf "$srcdir/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz"
  else
    tar -xf "$srcdir/dbeaver-ce-latest-linux.gtk.x86.tar.gz"
  fi
}

package() {
  cd $pkgdir
  mkdir -p opt/
  mkdir -p usr/bin
  mkdir -p usr/share/applications
  mkdir -p usr/share/icons/hicolor/48x48/apps

  cp -r $srcdir/$pkgname opt/
  cp opt/dbeaver/icon.xpm usr/share/icons/hicolor/48x48/apps/dbeaver.xpm
  ln -s /opt/dbeaver/dbeaver usr/bin/dbeaver
  install -m 644 $srcdir/dbeaver.desktop $pkgdir/usr/share/applications/
}
