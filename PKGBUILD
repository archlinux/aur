pkgname=hamster-time-tracker-git
pkgver=3.0.2.r53.gd10ae12c
pkgrel=1
pkgdesc="Time tracking application that helps you to keep track on how much time you have spent during the day on activities you choose to track (git version)"
arch=('any')
url="https://github.com/projecthamster/hamster"
license=('GPL')
#depends=('python2-dbus' 'python2-gconf' 'python2-notify' 'python2-wnck' 'python2-xdg' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('gtk3' 'python-dbus' 'python-cairo' 'python-gobject' 'python-xdg')
makedepends=('intltool')
provides=('hamster-time-tracker')
conflicts=('hamster-time-tracker' 'hamster-applet')
replaces=('hamster-applet')
install=$pkgname.install
source=('git+https://github.com/projecthamster/hamster.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hamster"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/hamster"
  python ./waf configure --prefix=/usr --libexecdir=/usr/lib --skip-icon-cache-update
  python ./waf build
}

package() {
  cd "$srcdir/hamster"
  python ./waf install --destdir="$pkgdir"
  rm "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
