# Maintainer: Philipp Leclercq <philipp (dot) leclercq (at) web (dot) de>
# Contributor: Evangelos Foutras <evangelos (at) foutrelis (dot) com>
# Contributor: Tobias Kieslich <tobias (at) archlinux (dot) org>

pkgname=thunar-archive-plugin-zstd
_pkgname=thunar-archive-plugin
pkgver=0.4.0
pkgrel=2
pkgdesc="Create and extract archives in Thunar - zstd support"
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
sha256sums=('bf82fa86a388124eb3c4854249c30712b2922e61789607268ee14548549b3115'
            'eb8a0e63170deecad0f0de834cf5c28ff7018d890530e0b0a8f3a66cb03441fc')

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

