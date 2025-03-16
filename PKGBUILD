#Maintainer: Reid Nelsen (dillweed) <drn102@gmail.com>

pkgname='xen-guest-agent-git'
pkgver=0.4.0.55.g5c274e6
pkgrel=1
pkgdesc='Xen guest agent tools written in Rust'
url='https://gitlab.com/xen-project/xen-guest-agent'
license=('GPL-3.0-or-later')

arch=('x86_64')

makedepends=('git' 'rust' 'clang')
depends=('xen' 'lsb-release')
conflicts=('xe-guest-utilities-xcp-ng' 
           'xe-guest-utilities-xcp-ng-git' 
           'xe-guest-utilities-git'
           'xe-guest-utilities'
           'xenstore-xcp-ng')

source=('git+https://gitlab.com/xen-project/xen-guest-agent.git'
        'xen-guest-agent.service')
sha256sums=('SKIP'
          '1c20a0381d85bbb0fbac0bc93a40f191848a00996a254d56da2d068a920f1648')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's|Release-||;s|[_-]|.|g'
}

build() {
  cd "$srcdir/$pkgbase"
  cargo build --release
}

package_xen-guest-agent-git() {
  install -Dm755 "$srcdir/xen-guest-agent/target/release/xen-guest-agent" "$pkgdir/usr/bin/xen-guest-agent"
  install -Dm644 "xen-guest-agent.service" "$pkgdir/usr/lib/systemd/system/xen-guest-agent.service"
}
