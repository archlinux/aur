# Maintainer: Philipp Leclercq <philipp (dot) leclercq (at) web (dot) de>
# Contributor: Evangelos Foutras <evangelos (at) foutrelis (dot) com>
# Contributor: Tobias Kieslich <tobias (at) archlinux (dot) org>

pkgname=thunar-archive-plugin-zstd
_pkgname=thunar-archive-plugin
pkgver=0.5.0
pkgrel=1
pkgdesc="thunar-archive-plugin with added zstd support"
arch=('x86_64')
url="https://docs.xfce.org/xfce/thunar/archive"
license=('GPL2')
conflicts=('thunar-archive-plugin')
provides=('thunar-archive-plugin')
depends=('thunar' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools' 'zstd')
optdepends=('file-roller'
            'engrampa'
            'ark'
            'xarchiver')
source=("https://archive.xfce.org/src/thunar-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        "zstd.patch")

sha256sums=('8eca88a358282a5acdea72984db0d930efdf658b4bc5b82ef7bcd06224366ffa'
            '949175314d08d268b4747e7b13a3ba966056ffe50e8ab5335f216eca8949d6df')

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
