# Maintainer: pezcurrel <pezcurrel@tiscali.it>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

pkgname=xfce4-sensors-plugin-nvidia-hddtemp_through_netcat-current
pkgver=1.3.95
pkgrel=1
pkgdesc='Sensors plugin for the Xfce panel with nvidia and hddtemp (through netcat) support'
arch=('x86_64')
url='https://docs.xfce.org/panel-plugins/xfce4-sensors-plugin'
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors' 'libxnvctrl' 'libnotify' 'hicolor-icon-theme')
makedepends=('xfce4-dev-tools' 'intltool' 'hddtemp' 'netcat')
optdepends=('hddtemp: for monitoring the temperature of hard drives'
            'netcat: for querying the temperature of hard drives from hddtemp configured and running as daemon')
conflicts=('xfce4-sensors-plugin' 'xfce4-sensors-plugin-nvidia')
provides=('xfce4-sensors-plugin')
source=('https://gitlab.xfce.org/panel-plugins/xfce4-sensors-plugin/-/archive/master/xfce4-sensors-plugin-master.tar.bz2')
sha256sums=('a616af41449b5aa73727d954f7129ff62aa32dd3b78f5e40162842df5376924e')

build() {
  cd "$srcdir/xfce4-sensors-plugin-master"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --datadir=/usr/share \
    --datarootdir=/usr/share \
    --disable-static \
    --disable-debug \
    --disable-pathchecks \
    --enable-hddtemp=yes \
    --enable-netcat
  make
}

package() {
  cd "$srcdir/xfce4-sensors-plugin-master"
  make DESTDIR="$pkgdir" install
}
