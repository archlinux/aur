# Maintainer: Jeremy Nobel <jeremynobel16@gmail.com>
pkgname=kls
pkgver=1.1.1
pkgrel=1
pkgdesc="A security-focused directory listing tool"
arch=('x86_64')
url="https://github.com/NobelC/kls"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NobelC/kls/archive/refs/tags/v$pkgver.tar.gz")
# Note: For new releases, the maintainer should update this hash using 'updpkgsums'
sha256sums=('290a1fbdc21e1711215e6d5468fb072ea0965fce4ff314b761e369e9aecfd9c6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SANITIZERS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
