# Maintainer: Popolon <popolon (@L popolon .org>

pkgname=sse2neon
pkgver=1.9.1
pkgrel=1
pkgdesc='Translator from Intel SSE intrinsics to Arm/Aarch64 NEON implementation'
arch=($CARCH)
url="https://github.com/DLTcollab/sse2neon"
license=('MIT License')
depends=('make')
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DLTcollab/sse2neon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b70e7cb8c5ce4641002b85deaafe97efdf9ade9b49884edeaf678b35f0e132f')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make  DESTDIR="$pkgdir" PREFIX="/usr"
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 sse2neon.h ${pkgdir}/usr/include/sse2neon.h

  for py in analyze-tiers.py  coverage-check.py  fuzz-progress.sh  gen-golden.py  gen-perf-report.py
  do
    install -Dm755 scripts/${py} ${pkgdir}/usr/bin/${py}
  done
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
