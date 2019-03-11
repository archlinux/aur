pkgname=openarc-git
pkgver=v1.0.0.Beta1.r0.g355ee2a
pkgrel=1
pkgdesc="Open source ARC implementation"
arch=('x86_64')
url="https://github.com/trusteddomainproject/OpenARC"
depends=("libmilter")
license=('Custom')
source=("openarc-git::git+https://github.com/trusteddomainproject/OpenARC.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build () {
  cd "$pkgname"
  autoreconf -fvi
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/etc/openarc"
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
