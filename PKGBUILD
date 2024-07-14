# Maintainer:
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=spectrwm
pkgver=3.6.0
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
sha256sums=('49854c5215475d2450d2558da12a3afe9019861170ba9d556c8b403d4d66f0d1')

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
