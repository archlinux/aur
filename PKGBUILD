# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=cxbqn
pkgver=0.10.4
pkgrel=1
pkgdesc='BQN VM written in C++.'
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
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDOCTEST_NO_INSTALL=ON \
    -DCXBQN_READLINE=ON
  make -C build -j 12
}

package() {
  make -C build DESTDIR="${pkgdir}" install/fast
  chmod 755 "${pkgdir}/usr/bin/cxbqn-config"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
