# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher
pkgver=5.15.3
pkgrel=1
pkgdesc='Application launcher for Linux'
arch=('any')
url="https://ulauncher.io"
license=('GPL3')
depends=('gobject-introspection-runtime' 'libkeybinder3' 'gtk3' 'webkit2gtk' 'libnotify'
         'gdk-pixbuf2' 'wmctrl' 'python-dbus' 'python-levenshtein' 'python-pyinotify'
         'python-websocket-client' 'python-pyxdg' 'python-gobject' 'python-cairo')
makedepends=('git' 'python-setuptools' 'python-distutils-extra')
optdepends=('libappindicator-gtk3: tray icon')
install="ulauncher.install"
source=("https://github.com/Ulauncher/Ulauncher/releases/download/${pkgver}/ulauncher_${pkgver}.tar.gz")
sha256sums=('ba702273a19382f645149c0f111875eb8bdf0e2144d332c45238000d1f78c39c')

build() {
  cd ulauncher
  env PATH=$(getconf PATH) python setup.py build
}

package() {
  cd ulauncher
  export PYTHONHASHSEED=0
  env PATH=$(getconf PATH) python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "$pkgdir"/usr/share/ulauncher/preferences/{no*,src,bow*,gul*,pack*}
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
