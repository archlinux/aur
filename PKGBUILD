# Contributor: Sergej Pupykin <sergej.pupykin@dsr-company.com>
_base=hatexmpp
pkgname=${_base}-git
pkgver=r274.673d450
pkgrel=1
pkgdesc="XMPP fuse filesystem"
arch=(i686 x86_64)
url="https://github.com/l29ah/${_base}"
license=('custom:WTFPL')
depends=(fuse2 loudmouth)
makedepends=(astyle git)
source=(git+${url})
pkgver() {
  cd "${pkgname%-git}"
  #	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
sha256sums=('SKIP')

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  install -Dm0755 ${_base} "$pkgdir"/usr/bin/${_base}
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
