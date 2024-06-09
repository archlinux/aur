# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx
epoch=2
_pkgver=1.0-beta4
pkgver=1.0beta4
pkgrel=1
pkgdesc="TaskBar with groupping and group manipulation"
arch=('any')
#url="https://github.com/M7S/dockbarx"
url="https://github.com/xuzhen/dockbarx"
license=('GPL-3.0-or-later')
depends=('libkeybinder3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-pyxdg')
makedepends=('python-setuptools' 'python-polib' 'python-installer' 'python-build'
             'python-packaging' 'python-wheel')
optdepends=('dockbarx-mate-applet: mate applet'
            'dockbarx-lxqt-plugin: lxqt applet'
            'xfce4-dockbarx-plugin: xfce4-panel plugin'
            'zeitgeist: recently used file list'
            'python-pyudev: dockx battery applet'
            'gconf: export settings from older versions of dockbarx'
            'python-lxml: import settings script')
_commit='ab8b856d9eb338ac83e0167573685c465204cf8b'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('8df37a367d4454c590d29cbaea9f7a3ec09ddf13905943b3becc717241c275da')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${_pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" "${pkgname}-${_pkgver}"/dist/*.whl
  
  install -Dm644 "${pkgname}-${_pkgver}"/data/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
