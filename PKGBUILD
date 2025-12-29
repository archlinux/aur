# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=xlibre-input-synaptics
pkgver=25.0.0
pkgrel=4
pkgdesc="XLibre fork of X.Org Synaptics driver for notebook touchpads"
arch=('x86_64')
license=('MIT')
_pkgname="${pkgname//xlibre/xf86}"
url="https://github.com/X11Libre/${_pkgname}"
depends=("xlibre-xserver>=${pkgver%.*}" 'glibc')
makedepends=("xlibre-xserver-devel>=${pkgver%.*}" 'xorgproto')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
groups=('xlibre-drivers')
depends+=('libxtst' 'libevdev' 'libx11' 'libxi')
provides+=('synaptics')
install=xlibre-input-synaptics.install

build() {
  cd ${srcdir}/${_pkgname}-xlibre-${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-xlibre-${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_pkgname}-xlibre-${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

sha256sums=('fca6a16ed199505a27dc167e88722b4d45aa5f46e86561d6c6eee3d7a750a107')
