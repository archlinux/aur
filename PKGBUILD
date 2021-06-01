# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=spotlight
pkgver=52.e6d845c
pkgrel=1
pkgdesc="Displays a new background image daily"
arch=('any')
license=('GPL')
url="https://github.com/mariusknaust/spotlight"
install=spotlight.install
depends=('wget'
         'jq'
         'perl'
         'gnome-settings-daemon'
         'libsystemd')
source=('git+https://github.com/mariusknaust/spotlight.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
package()
{
	install -m755 -D ${srcdir}/spotlight/spotlight.sh ${pkgdir}/usr/bin/spotlight.sh
	install -m644 -D ${srcdir}/spotlight/spotlight.service ${pkgdir}/usr/lib/systemd/user/spotlight.service
	install -m644 -D ${srcdir}/spotlight/spotlight.timer ${pkgdir}/usr/lib/systemd/user/spotlight.timer
	install -m644 -D ${srcdir}/spotlight/spotlight.desktop ${pkgdir}/usr/share/applications/spotlight.desktop
}
