# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitbranch=main
_gitauthor=devemio
pkgname=docker-color-output-git
pkgver=v2.0.0.r4.g9b9d14a
pkgrel=3
pkgdesc="Colors for Docker CLI"
arch=('x86_64')
license=('MIT')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git://github.com/${_gitauthor}/${pkgname%-git}#branch=${_gitbranch}")
sha512sums=('SKIP')
depends=('go')
makedepends=(git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Use last tag
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make
  mv bin/dco-linux-amd64 dco
  install -vDm 755 dco -t "${pkgdir}/usr/bin"
  #install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
