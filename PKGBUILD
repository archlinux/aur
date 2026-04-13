# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.12.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://github.com/kdeldycke/extra-platforms'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('86335d2052e72fe2cf006c841adb2adbfb317829c0ded220fe06ebe43e854848d1bdd3ccc1510f8a4bc512ef44e90dd08b3382054d799c56599114811a5bb54b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
