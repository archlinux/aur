# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=catfish
pkgname=${_pkgname}-devel
pkgver=4.15.0
pkgrel=1
pkgdesc='Versatile file searching tool (development release)'
arch=('any')
url='https://docs.xfce.org/apps/catfish/start'
license=('GPL')
install="${_pkgname}.install"
depends=('gtk3' 'python-cairo' 'python-gobject' 'python-pexpect'
         'python-ptyprocess' 'python-xdg' 'xdg-utils' 'python-dbus' 'xfconf>=4.14.0')
makedepends=('intltool' 'python-distutils-extra')
optdepends=('mlocate: filename search'
            'zeitgeist: integration with zeitgeist')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/apps/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('cefc43d091c719690d0c4ad259a757c89038ccdf290626674f54b1b1ea9cefbe')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package () {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/usr/share/icons/hicolor/scalable/apps/org.xfce.${_pkgname}.svg" \
    "${pkgdir}/usr/share/pixmaps/org.xfce.${_pkgname}.svg"
}
