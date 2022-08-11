# Maintainer: fenuks

pkgname=kanata
pkgver=1.0.6
pkgrel=1
pkgdesc="Bring the customizability of a QMK board to any keyboard near you"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/jtroo/kanata"
license=("LGPL-3.0")
depends=(libevdev)
optdepends=()
makedepends=("cargo")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz" 'kanata.service')
sha256sums=('24997d718b004db3bf5ce0068201c61b9e506854c3f220720d9b26fe145c6c8f'
            '02f657a0d3e6c2621d74282b192c45bbfba868a26c35fe0f351cb77c3c666e55')

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "${srcdir}/kanata.service"
}
