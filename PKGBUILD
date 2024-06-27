# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill-git
pkgver=0.14.4.r31.g3253d3c4
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'cargo')
provides=("nlnetlabs-krill=$pkgver")
conflicts=('nlnetlabs-krill')
source=("git+https://github.com/NLnetLabs/krill.git")
sha256sums=('SKIP')


prepare() {
  cd "krill"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "krill"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "krill"

  #cargo test \
  #  --frozen
}

package() {
  cd "krill"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .
}
