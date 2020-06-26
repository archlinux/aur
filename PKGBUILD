# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=nemo-dropbox
pkgver=4.6.0
pkgrel=1
pkgdesc="Dropbox for Linux - Nemo extension"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/linuxmint/nemo-extensions"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('nemo' 'dropbox' 'polkit')
groups=('nemo-extensions')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('f656a65ebb4454180f5dcddbb063c14410f38125151e762fc695993685d64edd')

prepare() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  # install the common license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
