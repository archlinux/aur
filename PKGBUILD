# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcf-validator
pkgver=0.6
pkgrel=2
pkgdesc="Validation suite for Variant Call Format (VCF) files"
arch=('i686' 'x86_64')
url=https://github.com/EBIvariation/"${pkgname}"
license=('Apache')
depends=('libpthread-stubs' 'libodb-sqlite' 'odb')
makedepends=('cmake' 'boost')
provides=('vcf-validator')
conflicts=('vcf-validator')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/EBIvariation/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('9ae64caea3439feed1f24268d82610f90dac6578169e0d87f82caeb7c349dadc')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  cmake -G "Unix Makefiles"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  scripts=('vcf_validator' 'vcf_debugulator' 'test_validator')

  for script in "${scripts[@]}"; do
    install -Dm755 bin/"${script}" "${pkgdir}"/usr/bin/"${script}"
  done

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 LICENSE_ODB "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE_ODB
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
