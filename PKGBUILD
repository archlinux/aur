# maintainer: odknt <oda.kenta.hj at gmail.com>
pkgname=bspwmbar
pkgver=0.5.4
pkgrel=1
pkgdesc='A lightweight status bar for bspwm'
arch=(x86_64)
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=(bspwm alsa-lib libx11 libxrandr libxft libxext fontconfig)
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
source=("https://github.com/odknt/bspwmbar/archive/v${pkgver}.tar.gz"
        'config.h')
sha256sums=('1a33a42c8180a01d16b31e77dd041f5cc7c7b4ec0c1502ac71072a2071fb46d6'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp ../config.h ./config.h
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install PREFIX=/usr DESTDIR="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
