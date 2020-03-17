# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: rasmus <rasmus . pank at gmail . com>

_pkgname=mailnag
pkgname=$_pkgname-git
pkgver=20200315.r749.75f6c12
pkgrel=1
pkgdesc='An extensible mail notification daemon'
arch=('any')
url='https://github.com/pulb/mailnag'
license=('GPL')
depends=('python-gobject' 'python-httplib2' 'python-xdg' 'python-dbus' 'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
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

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
