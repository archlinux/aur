# Maintainer: Stefen Wakefield <me@xstefen.dev>
pkgname=xmap-git
pkgver=2.0.0.r0.g8461c6a
pkgrel=1
pkgdesc="Fast Internet-wide IPv6 & IPv4 network scanner"
arch=('x86_64')
url="https://github.com/idealeer/xmap"
license=('Apache')
depends=('gmp' 'gengetopt' 'libpcap' 'json-c' 'libunistring')
makedepends=('cmake' 'flex' 'byacc' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/idealeer/xmap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cmake -DENABLE_DEVELOPMENT=OFF -DENABLE_LOG_TRACE=OFF .
    make    
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
    install -D -m644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
