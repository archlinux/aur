# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill-git
pkgver=0.10.0.r0.g2c00aa05
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
provides=("nlnetlabs-krill=$pkgver")
conflicts=('nlnetlabs-krill')
source=("git+https://github.com/NLnetLabs/krill.git")
sha256sums=('SKIP')


pkgver() {
  cd "krill"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "krill"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "krill"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/krill"
}
