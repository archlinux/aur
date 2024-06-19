# Maintainer: Lara Maia <dev@lara.monster>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=xfce4-pulseaudio-plugin-allow150
_pkgname=${pkgname/-allow150*/}
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=0.4.8
pkgrel=3
pkgdesc="Pulseaudio plugin for the Xfce4 panel with patches to allow 150% volume"
arch=('x86_64')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-pulseaudio-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libpulse' 'libkeybinder3' 'libnotify' 'libcanberra')
makedepends=('intltool')
optdepends=('pavucontrol: default pulseaudio mixer')
source=("git+https://git.xfce.org/panel-plugins/$_pkgname/#commit=$_commit")
source=(
  https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
  allow150.patch
)
sha256sums=('bd742b207c39c221e91c57c9c9be2839eb802d1b1ee01a02b7427cd02d3f0348'
            '1d554a8ed431855cfacc1d00f9355af62c9dcbdaeff4df834fd8c4342991361f')

prepare() {
  cd $_pkgname-$pkgver
  patch -p0 < ../allow150.patch
}

build() {
  cd $_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
