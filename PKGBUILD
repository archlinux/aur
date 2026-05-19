# Maintainer: Jeremy Nobel <jeremynobel16@gmail.com>
pkgname=kls
pkgver=0.1.1
pkgrel=2
pkgdesc="A security-focused directory listing tool"
arch=('x86_64')
url="https://github.com/NobelC/kls"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NobelC/kls/archive/refs/tags/v$pkgver.tar.gz")
# Note: For new releases, the maintainer should update this hash using 'updpkgsums'
sha256sums=('513f2b09ebd4e0626ff2b2c7eb42b4a54bbfa838c8fc575bbce4906e5288a1fc')

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
