# Maintainer: BlackDragon2447 <blackdragon2447@e.email>
pkgname='leftwm-config'
pkgver=0.1.0
pkgrel=1
pkgdesc="Config manager for LeftWM"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm-config"
license=('BSD')
depends=('leftwm')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("leftwm-config")
conflicts=("leftwm-config")
source=("$pkgname-$pkgver.tar.gz::https://github.com/leftwm/leftwm-config/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4188e8874a65bb3a9f41141173f66a99861539f89ab2b4de3c0e7aad44e9d5d8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # TODO: move this to stable on 0.2.0
  cargo +nightly build --release
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" $srcdir/$pkgname-$pkgver/LICENCE
  cd "$srcdir/$pkgname-$pkgver/target/release"
  install -Dm755 -t "${pkgdir}/usr/bin" leftwm-config
}
