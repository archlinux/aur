# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.16.2
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/krill/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba168732b9af2e5099ee8d3d85345d29aa650b106bf2cede176da2eb4c208ba9')


prepare() {
  cd "krill-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo generate-lockfile
  fi
  cargo fetch \
    --locked \
    --target host-tuple
}

check() {
  cd "krill-$pkgver"

  #cargo test \
    #--frozen
}

package() {
  cd "krill-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
}
