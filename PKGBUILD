# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xarchiver-assume-name
pkgver=0.5.4
pkgrel=2
pkgdesc="Xarchiver with the ability to archive directories without a name change"
arch=('i686' 'x86_64')
url="http://xarchiver.sourceforge.net/"
license=('GPL')
groups=('xfce4-goodies')
depends=('gtk2' 'desktop-file-utils')
makedepends=('intltool')
optdepends=('zip: ZIP support'
            'unzip: ZIP support'
            'p7zip: 7z support'
            'arj: ARJ support'
            'lzop: LZOP support'
            'cpio: RPM support'
            'unrar: RAR support')
source=(http://downloads.sourceforge.net/xarchiver/xarchiver-$pkgver.tar.bz2
        fix-rpm-support.patch
        fix-password-protected.patch
        add-mime-types.patch
	explicit-extension.patch)

prepare() {
  cd xarchiver-$pkgver

  # Fix RPM support
  patch -Np1 -i ../fix-rpm-support.patch

  # Fix segfault when handling password protected files
  patch -Np1 -i ../fix-password-protected.patch

  # Add more MIME types in the desktop file
  patch -Np1 -i ../add-mime-types.patch

  # Stop GTK filechooser from cding to a dir you want to archive
  patch -Np1 -i ../explicit-extension.patch
}

build() {
  cd xarchiver-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/xfce4
  make
}

package() {
  cd xarchiver-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('1b4cd37a6af03afc957a8e307417e8d0'
         '812b93339f5e3332621f3c5abebfe277'
         '35ab96d98521a0a36f3e9e9ec0969107'
         '0cee887b3c989ba2cdce9154813843fb'
         '5fb11bb9842f60dd29a0b3267c1ca804')
