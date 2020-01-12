# See AUR interface for current maintainer
# Edited to include libxnvctrl dependancy
# Based on http://xfce.10915.n7.nabble.com/NVidia-data-td16172.html
# also based on arch bug report https://bugs.archlinux.org/task/25548

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

_pkgname=xfce4-sensors-plugin
pkgname=xfce4-sensors-plugin-nvidia
pkgver=1.3.92
pkgrel=1
pkgdesc="A lm_sensors plugin for the Xfce panel with nvidia gpu support"
arch=('i686' 'x86_64')
url="https://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors' 'libnotify' 'hicolor-icon-theme' 'libxnvctrl')
makedepends=('intltool' 'hddtemp' 'gnu-netcat')
optdepends=('hddtemp: for monitoring the temperature of hard drives')
conflicts=('xfce4-sensors-plugin')
source=(https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --datadir=/usr/share \
    --datarootdir=/usr/share \
    --disable-static \
    --disable-debug \
    --disable-pathchecks
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
