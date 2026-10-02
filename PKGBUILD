pkgname=libfastjson-git
_pkgname="${pkgname/-git}"
pkgver=1.2609.0.r2.g2c76164
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
source=(git+https://github.com/rsyslog/libfastjson)
b2sums=('SKIP')
conflicts=(libfastjson)
provides=(libfastjson)

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
} 

build() {
  cd "${pkgname%-git}"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
