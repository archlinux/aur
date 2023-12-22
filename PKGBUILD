# Maintainer: Matthew Sexton <mssxtn@gmail.com>
# Contributor: Jerry Ling <jerry.ling ^at% cern.ch>

pkgname=gocloc-git
pkgver=0.5.2.r4.g7b24285
pkgrel=1
pkgdesc="A little fast cloc(Count Lines Of Code)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/hhatto/gocloc"
license=(MIT)
makedepends=(git go)
provides=(gocloc)
conflicts=(gocloc)
source=(git+https://github.com/hhatto/gocloc)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
}

check() {
  cd "${pkgname%-git}"
  make test
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 bin/gocloc -t "${pkgdir}"/usr/bin
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
