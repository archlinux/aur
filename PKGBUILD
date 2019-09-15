# Maintainer: mathieu.clabaut <mathieu.clabaut@gmail.com>

_pkgname=notifymuch
pkgname=notifymuch-git
pkgver=r39.9d4aaf5
pkgrel=3
pkgdesc='Display desktop notifications for unread mail in notmuch database'
arch=('x86_64')
url=https://github.com/kspi/notifymuch
license=('GPL')
depends=('hicolor-icon-theme' 'notmuch' 'python-gobject')
makedepends=('python-setuptools')
provides=("$_pkgname")
replaces=("$_pkgname")
source=("git+$url.git" "$_pkgname".{desktop,png})
sha512sums=('SKIP'
            'b968378113271d39cfddfb6e0c28ff2528be05c20ecfa31561e799e227167e28e0ff33ff8a4698f59857c2192150677dc84a9d40e8a103d53669b06b5d87c365'
            '2b94f087f4b6e3e01157de2aa03ac27bf5e85457a955c70450575729fc58ff0be53585dddcf5a7e84f840a95cf57596097a63e71df90ab67fcc6b54e84ea7425')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$_pkgname.desktop
  install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps \
    ../$_pkgname.png
}

# vim:set ts=2 sw=2 et:
