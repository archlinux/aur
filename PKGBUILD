# Maintainer: Edward Pacman <edward@edward-p.xyz>

pkgname=httpflow-git
pkgver=r66.53d560a
pkgrel=1
pkgdesc="Packet capture and analysis utility similar to tcpdump for HTTP"
arch=('x86_64')
url="https://github.com/six-ddc/httpflow"
license=('MIT')
depends=('libpcap' 'zlib' 'pcre')
makedepends=(git)

source=("${pkgname}::git+https://github.com/six-ddc/httpflow.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
 cd "${pkgname}"
 make
}

package() {
  # Install dkms.conf
  cd "${pkgname}"
  PREFIX="${pkgdir}/usr" make install
}
