# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=xwallpaper-git
pkgver=0.2.2+3+ga9855d2
pkgrel=1
pkgdesc='Wallpaper setting utility for X'
url='https://github.com/stoeckmann/xwallpaper'
arch=('i686' 'x86_64')
license=('ISC')
depends=('pixman' 'libpng' 'libxpm' 'xcb-util' 'xcb-util-image' 'libjpeg-turbo' 'libseccomp')
makedepends=('git')
provides=('xwallpaper')
conflicts=('xwallpaper')
source=(${pkgname}::git+https://github.com/stoeckmann/xwallpaper)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v(.+)|\1|'
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr \
    --with-zshcompletiondir=/usr/share/zsh/site-functions
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
