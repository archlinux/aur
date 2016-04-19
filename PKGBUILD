# Maintainer: nexttrex <jan@nexttrex.de>

pkgname='cinnamon-applet-system-monitor'
pkgver=r53.abff13d
pkgrel=1
pkgdesc='Cinnamon applet displaying system informations, such as memory usage, cpu usage, network rates. Ported from gnome-shell extension'
arch=('any')
url='https://github.com/cinnamon-applets/system-monitor-applet'
license=('GPL3')
depends=('cinnamon' 'dconf')
makedepends=('git')
install=$pkgname.install
source=("$pkgname::git+https://github.com/cinnamon-applets/system-monitor-applet.git")
sha256sums=('SKIP')
_appletname='system-monitor@ebbes'
_appletdir="usr/share/cinnamon/applets/$_appletname"

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"
  install -dm755 "$pkgdir/$_appletdir"
  find * -type f -exec install -Dm644 {} $pkgdir/$_appletdir/ \;

  install -dm755 "$pkgdir/usr/share/glib-2.0/schemas"
  install -m644 'org.cinnamon.applets.system-monitor.gschema.xml' "$pkgdir/usr/share/glib-2.0/schemas/"
}
