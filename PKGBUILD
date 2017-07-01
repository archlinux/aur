# Maintainer: Quentin Glidic <sardemff7@eventd.org>
# co-mantainer teraflops <cprieto.ortiz@gmail.com>

pkgname=weechat-eventc-git
_gitname=weechat-eventc
pkgver=bdbd5eb
pkgrel=1
pkgdesc="WeeChat plugin client for eventd http://weechat-eventc.eventd.org/"
arch=('any')
url="https://github.com/sardemff7/weechat-eventc"
license=('GPL3' 'LGPL3' 'MIT')
depends=('eventd')
makedepends=('git')
provides=('weechat-eventc-git')
conflicts=('weechat-eventc')
source=('weechat-eventc::git+https://github.com/sardemff7/weechat-eventc.git#branch=master')
sha256sums=('SKIP')
_weechat_plugindir='usr/lib/weechat/plugins/'

pkgver() {
 cd "$srcdir/$_gitname"/src
 git rev-parse --short HEAD
}

package() {
 cd $_gitname
 meson build
 ninja -C build
 mkdir -p "$pkgdir/$_weechat_plugindir"
 install -Dm755 build/eventc.so -t "$pkgdir/usr/lib/weechat/plugins/"
}

# vim:set ts=2 sw=2 et:
