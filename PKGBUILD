# Maintainer: Capricornus007 <sihaogang at gmail dot com>
pkgname=xfce4-systemload-plugin-git
_pkgname=${pkgname%-git}
pkgver=1.4.0.r111.g54fd2e1
pkgrel=1
pkgdesc='System load plugin for the Xfce panel'
arch=('i686' 'x86_64')
license=('GPL')
url='https://docs.xfce.org/panel-plugins/xfce4-systemload-plugin/start'
groups=('xfce4-goodies')
depends=('xfce4-panel' 'upower')
conflicts=('xfce4-systemload-plugin')
provides=('xfce4-systemload-plugin')
makedepends=('xfce4-dev-tools' 'meson' 'git')
options=('!libtool')
install=xfce4-systemload-plugin.install
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-systemload-plugin.git')
sha256sums=('SKIP')

pkgver() {
	  cd "$_pkgname"
	    git describe --long --tags | sed 's/^xfce4-systemload-plugin-//;s/\([^-]*-g\)/r\1/;s/-/./g'
    }

build() {
  arch-meson $_pkgname build \
    --localstatedir=/var
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

