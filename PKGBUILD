# Contributor: odknt <oda.kenta.hj at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bspwmbar-git
pkgver=0.5.5.r21.g68809c9
pkgrel=1
pkgdesc='A lightweight status bar for bspwm'
arch=('x86_64')
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=('bspwm' 'alsa-lib' 'libx11' 'libxrandr' 'libxft' 'libxext' 'fontconfig')
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
makedepends=('git')
conflicts=('bspwmbar')
provides=('bspwmbar')
source=("git+$url" config.h)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c2-|sed s+-+.r+ |tr - .
}

prepare() {
  cp "$srcdir"/config.h ${pkgname%-git}
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make install PREFIX=/usr DESTDIR="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
