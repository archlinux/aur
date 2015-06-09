# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng-git
_pkgname=caffeine-ng
pkgver=latest
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url=https://github.com/hobarrera/caffeine-ng
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle)
optdepends=("libindicator-gtk3: AppIndictor support.")
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
install=$pkgname.install
source=("git+https://git.barrera.io/hobarrera/caffeine-ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir"
}
