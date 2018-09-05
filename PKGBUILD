# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-git
pkgver=0.6.r11.g26c98ae
pkgrel=2
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('x86_64')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-setuptools' 'libnotify' 'libappindicator-gtk3')
conflicts=('battery-monitor' 'battery-monitor-devel-git')
provides=('battery-monitor')
source=("$pkgname"::'git+https://github.com/maateen/battery-monitor.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname}"
    export PYTHONPATH="$pkgdir/usr/lib/python3.7/site-packages"
    mkdir -p "$PYTHONPATH"
    make DESTDIR="$pkgdir/" install
}
