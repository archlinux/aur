# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx
epoch=2
_pkgver=1.0-beta3
pkgver=1.0beta3+19+gab8b856
pkgrel=1
pkgdesc="TaskBar with groupping and group manipulation"
arch=('i688' 'x86_64' 'armv7h' 'aarch64')
#url="https://github.com/M7S/dockbarx"
url="https://github.com/xuzhen/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-pyxdg')
makedepends=('python-setuptools' 'python-polib' 'python-installer' 'python-build'
             'python-packaging' 'python-wheel')
optdepends=('dockbarx-mate-applet: mate applet'
            'zeitgeist: recently used file list'
            'xfce4-dockbarx-plugin>=0.6: xfce4-panel plugin'
            'python-pyudev: dockx battery applet'
            'gconf: export settings from older versions of dockbarx'
            'python-lxml: import settings script')
_commit='ab8b856d9eb338ac83e0167573685c465204cf8b'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('41cea219d8e1febc718a717d7513701daffd8baf4420ae324a81f17ea0df06de')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's:-beta:beta:;s:-:+:g'
}

prepare() {
  cd "${pkgname}" #-${_pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" "${pkgname}"/dist/*.whl
  
  install -Dm644 "${pkgname}"/data/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
