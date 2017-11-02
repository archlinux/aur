# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcf-validator
pkgver=0.6
pkgrel=1
pkgdesc="Validation suite for Variant Call Format (VCF) files, implemented using C++11"
arch=('i686' 'x86_64')
url=https://github.com/EBIvariation/"${pkgname}"
license=('Apache2.0')
depends=('libpthread-stubs' 'libodb' 'libodb-sqlite' 'odb' 'sqlite>=3')
provides=('vcf-validator')
conflicts=('vcf-validator')
source=(https://github.com/EBIvariation/"${pkgname}"/archive/v"${pkgver}".tar.gz)
md5sums=('870899c6ba0ba83b4e0926b54681fce2')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  # These files are needed here!
  # How can I modify make or cmake scripts to respect that?

  #ln -s /usr/lib/odb/libodb-sqlite.so /usr/lib/libodb-sqlite.so
  #ln -s /usr/lib/odb/libodb.so /usr/lib/libodb.so

  cmake -G "Unix Makefiles"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/licenes
  mkdir -p "${pkgdir}"/usr/share/doc

  scripts=('vcf_validator' 'vcf_debugulator' 'test_validator')
  for script in "${scripts[@]}"; do
    cp bin/"${script}" "${pkgdir}"/usr/bin/"${script}"
  done

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/LICENSE
  install -D -m644 LICENSE_ODB "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/LICENSE_ODB
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/README.md
}
