# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-dacite'
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
pkgdesc="Simplify creation of data classes (PEP 557) from dictionaries."
url="https://github.com/konradhalas/dacite"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE" # License file is not included in PyPI tarball.
        )
sha512sums=('7e9ebf7da56aa8e65d5a5f0576a0e268344ee40459bdcde2560d17e90d4b73f660ce9dbec3ab5377100f42a21ad8698019b5b6f4fa03ddcd959af5ebb261b465'
            'e6962f48291088edaf156bcb8c3be115e3695c5f90c367e2a60f6061ce8f9be42472be6b4d20b8ecdd610c7143935b9b8e838e2e9236a07c8f706b69fddfa2a7')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
