# Contributor: odknt <oda.kenta.hj at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bspwmbar-git
pkgver=0.6.0.r140.d2ce636
pkgrel=1
epoch=1
pkgdesc='A lightweight status bar for bspwm'
arch=('x86_64')
license=('ISC')
url='https://gitlab.com/kenneth_08/bspwmbar'
depends=('bspwm' 'alsa-lib' 'libx11' 'libxrandr' 'libxft' 'libxext' 'fontconfig')
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
makedepends=('git')
conflicts=('bspwmbar')
provides=('bspwmbar')
source=("git+$url.git" LICENSE)
sha256sums=('SKIP'
            '17444c83e24d5ac40177021ade7ffc88adc7432c7cc34ee651cc7e1826e0af4d')

pkgver() {
  cd ${pkgname%-git}
  printf %s.r%s.%s  $(grep ^VERSION configure|cut -dv -f2) $(git rev-list --count HEAD) $(git describe --always)
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm755 ${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
