# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='namestand'
pkgname="python-${_pkgname}"

pkgver=0.1.1
pkgrel=1
_commit_license='b26f3e3ab9dcf1fef84bf4d30756d7b1d6d46dab'

pkgdesc='Standardize any list of strings, but especially database/CSV column-names'
arch=('any')
url='https://github.com/buzzfeednews/namestand'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "license-${_commit_license}::${url}/raw/${_commit_license}/LICENSE.txt")
sha256sums=('f6a02000e2a5fb0c90eae2c8986d9a692d1c6d397137a745ea98d655752e5f02'
            'd537bb82913331dcf3a00c9d312e0789a73cb7fddce4f08f63222d2f30809ea9')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "license-${_commit_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
