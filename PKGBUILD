# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=cxbqn
pkgver=0.8.0
pkgrel=1
pkgdesc='BQN virtual machine.'
arch=('x86_64')
url='https://github.com/ashermancinelli/cxbqn'
license=('GPL3')
conflicts=('cbqn'{,-git} "${pkgname}-git")
depends=('gcc-libs' 'glibc' 'readline')
makedepends=('cmake' 'git')
optdepends=('ttf-bqn386: BQN and APL-compatible font')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  mkdir "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake -DCXBQN_READLINE=ON ..
  make -j12
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 build/BQN "${pkgdir}/usr/bin/bqn"

  cd ext/cbqn
  install -Dm644 community/README.md "${pkgdir}/usr/share/doc/${pkgname}/community.md"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.md
}
