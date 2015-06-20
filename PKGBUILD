# Maintainer:  Christopher Arndt <chris -at- chrisarndt -dot- de>

_pkgname=xcftools
pkgname="${_pkgname}-git"
pkgver=1.0.7.r18.196f517
pkgrel=1
pkgdesc="Command line tools for extracting images and information from GIMP XCF files (Git version)."
url="https://github.com/j-jorge/xcftools/"
arch=('x86_64' 'i686')
license=('Custom')
depends=('libpng' 'perl')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/j-jorge/xcftools.git"
        "LICENSE")
sha256sums=('SKIP'
            'ad91bc83ff4050aca9867ee0d9b5921f8a31fe50d37b9aaf0e260aa0b4e8987a')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(grep PACKAGE_VERSION= configure | cut -f 2 -d "'")
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
