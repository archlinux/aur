# Maintainer:
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=spectrwm
pkgver=3.7.0
_pkgver="${pkgname^^}_${pkgver//./_}"
pkgrel=1
pkgdesc='A small, dynamic tiling and reparenting window manager for X11'
arch=('x86_64')
url='https://github.com/conformal/spectrwm'
license=('ISC')
depends=('bash' 'fontconfig' 'glibc' 'libbsd' 'libx11' 'libxcb' 'libxcursor' 'libxft' 'xcb-util' 'xcb-util-keysyms' 'xcb-util-wm')
makedepends=('libxt')
replaces=('scrotwm')
backup=(etc/spectrwm.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('9541ceb713dd186755643a85b03e9ebe98b9703b00025d229ee92a6ba910c805')

prepare() {
  cd "${pkgname}-${_pkgver}"
  sed -i 's|/usr/local/lib/|/usr/lib/|' spectrwm.c
}

build() {
  cd "${pkgname}-${_pkgver}/linux"
  make PREFIX='/usr'
}

package() {
  cd "${pkgname}-${_pkgver}/linux"
  make PREFIX='/usr' SYSCONFDIR='/etc' DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
