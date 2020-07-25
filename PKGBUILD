# Contributor: odknt <oda.kenta.hj at gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bspwmbar-x11-git
pkgver=0.6.0.r140.d2ce636
pkgrel=1
epoch=1
pkgdesc='A lightweight status bar for bspwm, fork without xcb'
arch=('x86_64')
license=('ISC')
url='https://gitlab.com/kenneth_08/bspwmbar'
depends=('bspwm' 'alsa-lib' 'libx11' 'libxrandr' 'libxft' 'libxext' 'fontconfig')
optdepends=('ttf-nerd-fonts-symbols: default prefix icons font')
makedepends=('git')
conflicts=('bspwmbar')
provides=('bspwmbar')
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
  cd ${pkgname%-x11-git}
  printf %s.r%s.%s  $(grep ^VERSION configure|cut -dv -f2) $(git rev-list --count HEAD) $(git describe --always)
}

build() {
  cd ${pkgname%-x11-git}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-x11-git}
  install -Dm755 ${pkgname%-x11-git} "$pkgdir"/usr/bin/${pkgname%-x11-git}
  install -Dm644 docs/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
