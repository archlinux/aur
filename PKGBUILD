# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-repomatic
_name=${pkgname#python-}
pkgver=6.26.0
pkgrel=1
pkgdesc='Automate repository maintenance, releases, and CI/CD workflows'
url='https://kdeldycke.github.io/repomatic/'
makedepends=(python-build python-installer python-uv-build)
depends=(python python-click python-yaml python-extra-platforms python-tomli python-boltons python-packaging python-click-extra python-typing_extensions python-wcmatch)
license=('GPL-2.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d641493d0d2ab94f4aca17fe983da8f6be85be441c6f3aab26cc1a9a31fba27e91548d0aa406bd4a694f7ac37f5d000b879fd4e9d9d4cd360e1e6edfd9376a24')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
