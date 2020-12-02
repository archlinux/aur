# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=nemo-dropbox
pkgver=4.8.0
pkgrel=1
pkgdesc="Dropbox for Linux - Nemo extension"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/linuxmint/nemo-extensions"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('nemo' 'dropbox' 'polkit')
groups=('nemo-extensions')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('1b7b85b41c659fe0f93a9b83fadb81a7934c7e7cb2df9eda4a03413b7f5d05c4')

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
