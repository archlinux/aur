# Contributor: twa022 <twa022 at gmail dot com>

pkgname=xfce4-dockbarx-plugin
epoch=1
_pkgver=0.6
pkgver=0.6+r65+aa9c974
pkgrel=1
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/m7s/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=1.0beta' 'xfce4-panel>=4.12')
makedepends=('git' 'vala')
_commit='aa9c974d82df99ede2c6eabf4d7b1663bfd69f42'
source=("${pkgname}::git+https://github.com/xuzhen/${pkgname}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s+r%s+%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  PREFIX=/usr python ./waf configure
}

build() {
  cd "${srcdir}/${pkgname}"
  python ./waf build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" python ./waf install
}

