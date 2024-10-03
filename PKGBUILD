# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-dev-tools
pkgname=${_pkgname}-devel
pkgver=4.19.3
pkgrel=1
pkgdesc="Xfce developer tools (Development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-dev-tools/start"
license=('GPL2')
depends=('glib2' 'gtk-doc')
optdepends=('docker: xfce-build helper script')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/xfce4-dev-tools/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('91ed21adb3083b0bfbfdf40872baefdb4fb4a604eed06251d86935e67e07f6ac')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
