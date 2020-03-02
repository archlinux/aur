# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-cmsis-pack-manager
_pkgname=cmsis-pack-manager
pkgver=0.2.9
pkgrel=1
pkgdesc='A Python module for handling CMSIS Pack files'
arch=(any)
url='https://github.com/ARMmbed/cmsis-pack-manager'
license=('Apache')
depends=('python'
         'python-appdirs'
         'python-milksnake'
         'python-pyaml'
         'python-wheel'
         'rust'
        )

source=(https://github.com/ARMmbed/${_pkgname}/archive/v${pkgver}.tar.gz
        0001-cargo-Deps-to-support-rust-v1.41.1.patch
       )
sha256sums=('34aad5aa198d1c5844f747e484420925789d62eaf0164064193c3a821a1c562a'
            'bbf4cae10043f66642f4b56db91407ae238873d36be6db46bc573b0e91381407')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/0001-cargo-Deps-to-support-rust-v1.41.1.patch"
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
