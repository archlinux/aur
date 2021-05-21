# Maintainer: ny-a <nyaarch64 at gmail dot com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>

pkgname=rem
pkgver=1.0.0
pkgrel=1
pkgdesc="portable library for real-time audio and video processing"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/baresip/rem"
license=('BSD')
depends=('re')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/${pkgname}/archive/v${pkgver}.tar.gz"
        "rem-flags.patch")
sha256sums=('bcc91bb521fae183357fb422b00a3981477a22e99d3afe165c4ec50a6bbed9da'
            '2db9d6f0264a40ca59d7cc06855ba762e1759596f2a87a818bd72fa5a5626f41')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/rem-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
