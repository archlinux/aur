# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: rasmus <rasmus . pank at gmail . com>

_pkgname=mailnag
pkgname=$_pkgname-git
pkgver=20210411.r797.7ef9105
pkgrel=3
pkgdesc='An extensible mail notification daemon'
arch=('any')
url='https://github.com/pulb/mailnag'
license=('GPL')
depends=('python-gobject' 'python-httplib2' 'python-xdg' 'python-dbus' 'python-zombie-imp' 'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
makedepends=('gettext' 'git')

optdepends=(
  'mailnag-goa-plugin-git: GNOME Online Accounts integration'
  'libgnome-keyring: save password storage in GNOME 3'
  'gnome-keyring: save password storage in GNOME 3'
  'networkmanager: network connectivity detection'
)

source=("git+$url" 'deprecated-ssl.diff')
sha512sums=('SKIP' 'fe0aa6f637dff551639a4d5ec4fc00fc934d67d32cd821b15e5c20e9c15924e9252b0e5ac2efa07909a2cec999241b5abfed4c9965a841ff1be9f830b420c738')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 < ../deprecated-ssl.diff
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
