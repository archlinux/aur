pkgname=minisign-git
pkgver=0.10.r6.g4b2df2e
pkgrel=1
epoch=1
pkgdesc='A dead simple tool to sign files and verify signatures.'
arch=('x86_64')
url='https://jedisct1.github.io/minisign/'
license=('MIT')
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
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd minisign/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
