# Maintainer: Capricornus007 <sihaogang at gmail dot com>
pkgname=xfce4-smartbookmark-plugin-git
_pkgname=${pkgname%-git}
pkgver=xfce4.smartbookmark.plugin.0.6.0.r119.g592b830
pkgrel=1
pkgdesc='Plugin for the Xfce4 panel that lets you quicksearch from selected websites'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-smartbookmark-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-smartbookmark-plugin')
provides=('xfce4-smartbookmark-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-smartbookmark-plugin.install
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-smartbookmark-plugin')
sha256sums=('SKIP')

pkgver() {
	  cd "$_pkgname"
	    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    }

build() {
  meson setup --prefix=/usr \
              --buildtype=plain \
              "${pkgname%-git}" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
