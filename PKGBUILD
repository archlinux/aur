# Maintainer: pezcurrel <pezcurrel@tiscali.it>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

pkgname=xfce4-sensors-plugin-nvidia-hddtemp_through_netcat-current
_realpkgname=xfce4-sensors-plugin
pkgver=1.3.90
pkgrel=4
pkgdesc="A lm_sensors plugin for the Xfce panel with nvidia and hddtemp (through netcat) support, current version"
arch=('x86_64')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-sensors-plugin'
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors' 'libxnvctrl' 'libnotify' 'hicolor-icon-theme')
makedepends=('xfce4-dev-tools' 'intltool' 'hddtemp' 'netcat')
optdepends=('hddtemp: for monitoring the temperature of hard drives'
            'netcat: for querying the temperature of hard drives from hddtemp configured and running as daemon')
conflicts=('xfce4-sensors-plugin' 'xfce4-sensors-plugin-nvidia')
provides=("$_realpkgname")
source=("https://git.xfce.org/panel-plugins/$_realpkgname/snapshot/$_realpkgname-Release_V$pkgver.tar.gz")
sha256sums=('37f8c0446614f06f0519559ecf74b9da457f60868b20f969cab14850c612d9d0')

build() {
  cd "$srcdir/$_realpkgname-Release_V$pkgver"
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
  cd "$srcdir/$_realpkgname-Release_V$pkgver"
  make DESTDIR="$pkgdir" install
}
