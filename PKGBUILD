# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx
pkgname="${_pkgname}"-gtk3-git
_branchname='pygi-python3'
epoch=1
pkgver=0.93+141+g1321d84
pkgrel=1
pkgdesc="DockBarX GTK3 port. (Standalone panel and mate applet)"
arch=('i688' 'x86_64')
url="https://github.com/M7S/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python-cairo' 'python-dbus' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-xdg')
makedepends=('python-setuptools' 'python-polib' 'git')
optdepends=('mate-panel: mate applet'
            'zeitgeist: recently used file list'
            'xfce4-dockbarx-plugin-gtk3-git: xfce4 plugin'
            'python-pyudev: dockx battery applet')
provides+=("${_pkgname}=${pkgver%%+*}")
source=("${_pkgname}"::git+https://github.com/M7S/dockbarx.git#branch=${_branchname})
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/-gtk3//;s/-/+/g"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root "${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/${_pkgname}"/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
