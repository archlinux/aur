# Maintainer: Ckat <ckat@yandex.ru>
pkgname=weechat-xmpp-git
pkgver=r1.r45.g0efe037
pkgrel=1
pkgdesc='A weechat plugin in C/++ for XMPP support, minimal but idealy maximal set of XEPs'
arch=('any')
url=https://github.com/bqv/weechat-xmpp
license=('MIT')
depends=('libstrophe' 'libxml2' 'lmdbxx' 'libomemo-c' 'libsignal-protocol-c' 'gpgme' 'weechat' 'fmt')
makedepends=('git' 'bison' 'flex' 'doctest')
provides=('weechat-xmpp')
source=("$pkgname::git+https://github.com/bqv/weechat-xmpp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare () {
  # horrors of the diff lib, do not try to understand
  unset CFLAGS
}

build() {
  cd "$srcdir/$pkgname"
  make weechat-xmpp
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 xmpp.so "$pkgdir/usr/lib/weechat/plugins/xmpp.so"
}
