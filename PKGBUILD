# See AUR interface for current maintainer
# Edited to include libxnvctrl dependancy
# Based on http://xfce.10915.n7.nabble.com/NVidia-data-td16172.html
# also based on arch bug report https://bugs.archlinux.org/task/25548

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

_pkgname=xfce4-sensors-plugin
pkgname=xfce4-sensors-plugin-nvidia
pkgver=1.4.1
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
source=(
	https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
)
sha256sums=('37d0dc569e735e482a18545c24eb1ce0229d6910e3a4d4c1dee0680999234be2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-xnvctrl \
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
