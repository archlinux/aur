# maintainer: odknt <oda.kenta.hj at gmail.com>
pkgname=bspwmbar
pkgver=0.5.5
pkgrel=1
pkgdesc='A lightweight status bar for bspwm'
arch=(x86_64)
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=(bspwm alsa-lib libx11 libxrandr libxft libxext fontconfig)
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
source=("https://github.com/odknt/bspwmbar/archive/v${pkgver}.tar.gz"
        'config.h')
sha256sums=('fe8faca93b25b83333147ded746dd3d590d5d50e8fbab1d010c4c6b7befcd9a1'
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
