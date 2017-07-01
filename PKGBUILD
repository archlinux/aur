# Maintainer: Quentin Glidic <sardemff7@eventd.org>
# Packager: teraflops <cprieto.ortiz@gmail.com>

pkgname=weechat-eventc-git
_gitname=weechat-eventc
pkgver=bdbd5eb
pkgrel=1
pkgdesc="WeeChat plugin client for eventd http://weechat-eventc.eventd.org/"
arch=('any')
url="https://github.com/sardemff7/weechat-eventc"
license=('GPL3')
depends=('eventd')
makedepends=('git')
provides=('weechat-eventc-git')
conflicts=('weechat-eventc')
source=('weechat-eventc::git+https://github.com/sardemff7/weechat-eventc.git#branch=master')
sha256sums=('SKIP')
_weechat_plugindir='usr/lib/weechat/plugins/'

pkgver() {
 cd "$_gitname"/src
 git rev-parse --short HEAD
}

build(){
    cd "$_gitname"
    meson --prefix=/usr "$srcdir"/build
    ninja -C "$srcdir"/build

}

package() {
    DESTDIR="$pkgdir" ninja -C "$srcdir"/build install
}
