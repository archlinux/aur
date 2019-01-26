# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

_pkgbase=thunar
pkgname=(${_pkgbase}-gtk2)
pkgver=1.6.16
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
            'thunar-archive-plugin-gtk2: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags')
source=(https://archive.xfce.org/src/xfce/thunar/${pkgver%.*}/Thunar-$pkgver.tar.bz2)
sha256sums=('cb9fc2a8005494124a8d412eff7d7cb8032f7ff91b3d254fcff2d0a0d2790d20')

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
