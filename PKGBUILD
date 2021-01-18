# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=ivm
pkgver=0.1.3
pkgrel=2
pkgdesc="The cross-platform Inko version manager"
url="https://gitlab.com/inko-lang/ivm"
depends=('gcc-libs')
makedepends=('fakeroot' 'cargo')
arch=('x86_64')
license=('MPL2')
provides=('inko')
source=(
  "https://gitlab.com/inko-lang/ivm/-/archive/v${pkgver}/ivm-v${pkgver}.tar.bz2"
)
sha256sums=(
  'db4241195e1ed0efb9b4ab3f8f0ac76186d47163020c2d4486d84367cd6d9423'
)

build() {
  cd "${pkgname}-v${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-v${pkgver}"
  install -D -m755 target/release/ivm "${pkgdir}/usr/bin/ivm"
  install -D -m644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
