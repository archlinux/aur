# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-testsuite'
_pkgname=${pkgname#python-}
pkgver=27.3
pkgrel=2
pkgdesc="Generic Testsuite Driver in Python"

arch=('any')
url="https://github.com/AdaCore/e3-testsuite"
license=('GPL-3.0-only')

depends=('python' 'python-e3-core')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')

source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz"
)
sha256sums=('bf4d65997fe2dc4eb8b7a34dcafe1db85210628473365ee2aa1a013d7769d38e')

build() {
    cd "${srcdir}/${_pkgname/-/_}-${pkgver}" || exit
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname/-/_}-${pkgver}" || exit
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
