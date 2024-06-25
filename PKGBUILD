# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.11.0
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=(any)
url=https://github.com/trailofbits/twa
license=(MIT)
depends=(
  bash
  bind-tools
  curl
  jq
  netcat
)
makedepends=(git)
checkdepends=(
  shellcheck
  testssl.sh
)
optdepends=('testssl.sh: for testssl-based checks')
source=("git+$url.git#tag=v$pkgver")
b2sums=('e4c36068f0bf957abbeb2f11b6c0addb401415275cbb5795ad461f8f71bf64a7ec9453979c27e9162dad9e402b30009db4a22cff5c1041ba46ea902dd38cbeba')

check() {
  cd twa
  ./util/test
}

package() {
  cd twa
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}
