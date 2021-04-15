# Maintainer: willemw <willemw12@gmail.com>

pkgname=gshowtv
pkgver=1.2.2
pkgrel=2
pkgdesc="TV program schedule viewer and a Personal Video Recorder GUI"
arch=('x86_64')
url="http://sourceforge.net/projects/gshowtv"
license=('GPL')
makedepends=('gnome-doc-utils')
depends=('glade-perl' 'gnome-doc-utils' 'gtk2-perl' 'libgnome' 'perl-libintl-perl' 'perl-libwww' 'perl-xml-simple' 'xmltv')
optdepends=('libnotify: desktop notifications'
            'nautilus: file manager'
            'xmltv-druid: XMLTV configurator')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('600379731e8c8b297b216290773c8f94')

prepare() {
  cd $pkgname

  # Patch for error "Can't use 'defined(@array)'"
  sed -i 's/if (!defined (@ARGV) || /if (/g' bin/gshowtv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  make DESTDIR="$pkgdir" install

  #mv "$pkgdir/usr/bin/site_perl/gshowtv" "$pkgdir/usr/bin/"
  #rmdir "$pkgdir/usr/bin/site_perl"
}

