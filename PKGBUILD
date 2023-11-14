pkgname=minisign-git
pkgver=0.7.4.r1.g8aef018
pkgrel=1
epoch=1
pkgdesc='A dead simple tool to sign files and verify signatures.'
arch=('x86_64')
url='https://jedisct1.github.io/minisign/'
license=('custom:ISC')
depends=('libsodium')
makedepends=('cmake' 'git')
provides=('minisign')
source=('git+https://github.com/jedisct1/minisign')
sha256sums=('SKIP')

pkgver() {
  cd minisign
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd minisign
  cmake -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd minisign/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
