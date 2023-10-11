# Maintainer: Philipp Leclercq <philipp (dot) leclercq (at) web (dot) de>
# Contributor: Evangelos Foutras <evangelos (at) foutrelis (dot) com>
# Contributor: Tobias Kieslich <tobias (at) archlinux (dot) org>

pkgname=thunar-archive-plugin-zstd
_pkgname=thunar-archive-plugin
pkgver=0.5.1
pkgrel=1
pkgdesc="thunar-archive-plugin with added zstd support"
arch=('x86_64')
url="https://docs.xfce.org/xfce/thunar/archive"
license=('GPL2')
conflicts=('thunar-archive-plugin')
provides=('thunar-archive-plugin')
depends=('thunar' 'hicolor-icon-theme' 'zstd')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('file-roller'
            'engrampa'
            'ark'
            'xarchiver')
source=("https://archive.xfce.org/src/thunar-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        "zstd.patch")

sha256sums=('a81b3ab1d3cd77c7b3d6db15b37a3c12d65b06e373edc3c21083f02d605d8bed'
            '89984f89cc4af0072467e681e4d0a753ec118c62a4ccfe5a733425649e1b11c8')

prepare() {
  patch -p1 -u -i "$srcdir/zstd.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
