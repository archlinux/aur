# Contributor: odknt <oda.kenta.hj at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bspwmbar-git
pkgver=0.6.1.r1.g5221197
pkgrel=1
epoch=1
pkgdesc='A lightweight status bar for bspwm'
arch=('x86_64')
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=('bspwm' 'alsa-lib' 'libx11' 'libxrandr' 'libxft' 'libxext' 'fontconfig')
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
makedepends=('git')
conflicts=('bspwmbar')
provides=('bspwmbar')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf %s $(git describe --tags|cut -c2-|sed 's+-+.r+' | tr - .)
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm755 ${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
#  install -Dm644 docs/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 docs/${pkgname%-git}.png  "$pkgdir"/usr/share/pixmaps/${pkgname%-git}.png
}
