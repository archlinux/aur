pkgname=libfastjson-git
_pkgname="${pkgname/-git}"
pkgver=1.2304.0.r25.ga630254
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
source=(git+https://github.com/rsyslog/libfastjson)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
} 

build() {
  cd "$_pkgname"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
