# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=zterm

pkgname="${_pkgname}"
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple terminal emulator using Vte and Gtk+ writting using the Zig programming language"
url="https://gitlab.com/jeang3nie/zterm"
depends=('libgtk-3.so' 'libvte-2.91.so')
makedepends=('git' 'gyro' 'zig')
arch=('x86_64')
provides=('zterm')
conflicts=('zterm')
source=(
  "${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2"
  'clap-branch-zig-master.patch'
)
sha256sums=(
  '4cd490e032905bea6424b09477259e0beb6fb2908b9cb7b088c2a3c996db3bc1'
  '23a30b33e6406f8922c15cfaa60ecaedca85b951167528a09ac25e52e215df8b'
)

prepare() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  patch -p0 -i ../clap-branch-zig-master.patch
}

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  gyro build -Drelease-safe=true
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  install -D -m755 zig-out/bin/zterm "${pkgdir}/usr/bin/zterm"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 data/zterm.desktop "${pkgdir}/usr/share/applications/zterm.desktop"
  install -D -m644 data/zterm.svg "${pkgdir}/usr/share/pixmaps/zterm.svg"
}
