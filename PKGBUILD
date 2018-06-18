# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

_pkgbase=thunar
pkgname=(${_pkgbase}-gtk2)
pkgver=1.6.15
pkgrel=1
pkgdesc="Modern file manager for Xfce (GTK2 version)"
arch=('x86_64')
url="http://thunar.xfce.org"
license=('GPL2' 'LGPL2.1')
groups=('xfce4')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'libgudev' 'gtk2' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('intltool' 'xfce4-panel')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
            'xfce4-panel: for trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags')
source=(https://archive.xfce.org/src/xfce/thunar/${pkgver%.*}/Thunar-$pkgver.tar.bz2)
sha256sums=('e81291a8519f495e0a059ff1f2d29608bc6d37c0be83b1f38f3c9aa25f8d252d')

build() {
  cd "$srcdir/Thunar-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gio-unix \
    --enable-dbus \
    --enable-gudev \
    --enable-notifications \
    --enable-exif \
    --enable-pcre \
    --disable-debug
  make
}

package() {
  cd "$srcdir/Thunar-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
