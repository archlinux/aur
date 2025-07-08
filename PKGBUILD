# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=xss-lock-session
pkgver=0.3.0 # renovate: datasource=github-tags depName=xdbob/xss-lock
pkgrel=4
pkgdesc="Forked version of xss lock that allows specifying a session"
arch=('i686' 'x86_64')
url="https://github.com/xdbob/xss-lock"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils' 'git' 'xcb-util')
optdepends=('bash-completion: for bash completion')
provides=('xss-lock')
conflicts=('xss-lock')
source=("$pkgname::git+https://github.com/xdbob/xss-lock.git#tag=v${pkgver}")
md5sums=('1e6f02dea0800a38e8208c040439d741')

build() {
  cd "$pkgname"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
