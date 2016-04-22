# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: rasmus <rasmus . pank at gmail . com>

_pkgname=mailnag
pkgname=$_pkgname-git
pkgver=20160420.r566.25d3c01
pkgrel=1
pkgdesc='An extensible mail notification daemon'
arch=('any')
url='https://github.com/pulb/mailnag'
license=('GPL')
depends=('python2-gobject' 'python2-httplib2' 'python2-xdg' 'python2-dbus' 'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
makedepends=('gettext' 'git')
optdepends=(
  'mailnag-goa-plugin-git: GNOME Online Accounts integration'
  'libgnome-keyring: save password storage in GNOME 3'
  'gnome-keyring: save password storage in GNOME 3'
  'networkmanager: network connectivity detection'
)
source=("git+$url")
sha512sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$pkgname.install"

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  python2 setup.py install --root="$pkgdir"
}
