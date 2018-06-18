# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

_pkgbase=thunar-archive-plugin
pkgname=(${_pkgbase}-gtk2)
pkgver=0.3.1
pkgrel=7
pkgdesc="Create and extract archives in Thunar (GTK2 version)"
arch=('x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
license=('GPL2')
groups=('xfce4-goodies')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('thunar' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('file-roller'
            'ark'
            'xarchiver')
source=(https://archive.xfce.org/src/thunar-plugins/thunar-archive-plugin/0.3/thunar-archive-plugin-$pkgver.tar.bz2
        0001-Fix-file-roller-3.12.1-detection-bug-10826.patch)
sha256sums=('9ad559b0c11308f6897ad56604e5a06dc8f369f649eb20120b2d3018ef5da54c'
            '4373c3011f5abd1d4119d283e832aeb858c810f14b3a59b6250cf10893aa0757')

prepare() {
  cd "$srcdir/thunar-archive-plugin-$pkgver"

  # https://bugzilla.xfce.org/show_bug.cgi?id=10826
  patch -Np1 -i ../0001-Fix-file-roller-3.12.1-detection-bug-10826.patch
  NOCONFIGURE=1 xdt-autogen
}

build() {
  cd "$srcdir/thunar-archive-plugin-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "$srcdir/thunar-archive-plugin-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
