# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=speedtest++
_gitname=SpeedTest
pkgver=v1.11.r13.g262daf8
pkgrel=1
pkgdesc="Unofficial speedtest.net cli using raw TCP for better accuracy"
arch=('any')
url="https://github.com/taganaka/SpeedTest"
license=('MIT')
depends=('curl' 'openssl' 'libxml2')
makedepends=('git' 'cmake')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  ln -s "/usr/bin/SpeedTest" "$pkgdir/usr/bin/speedtest++"
  install -Dm644 "$srcdir/${_gitname}/README.md" "${pkgdir}/usr/share/doc/${_gitname}/README"
}
