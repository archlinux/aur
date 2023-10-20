# Maintainer: fuero <fuerob@gmail.com>
pkgname=x86-64-level
# renovate: datasource=github-releases depName=HenrikBengtsson/x86-64-level
pkgver=0.2.2
pkgrel=2
pkgdesc='Get the x86-64 Microarchitecture Level on the Current Machine'
arch=('any')
url="https://github.com/HenrikBengtsson/x86-64-level"
source=(
  ${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('3fcefeb1db094ce069dd6a4ddfd85ef92fc572dabbc3e430d32a1903e7d28f82')
license=('CC-BY-SA-4.0')
depends=(
  bash
)
checkdepends=(
  make
  shellcheck
)

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}

check() {
  cd "$pkgname-$pkgver"
  make check
}
