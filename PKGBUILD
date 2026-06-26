# Maintainer: Agil Mammadov <mammadovagil@protonmail.me>
pkgname=aurmod
pkgver=0.1.0
pkgrel=1
pkgdesc="Managing aur packages with git submodules"
arch=("any")
url="https://github.com/stiermid/aurmod"
license=("GPL-3.0-or-later")
depends=(git python python-click python-gitpython)
makedepends=(python-build python-installer python-wheel python-hatchling)
provides=("python-$pkgname")
conflicts=("python-$pkgname")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7eaf05fd36a34a887a262ba8f204a30341d0428095b163b4587c3be6a7dacb6e')

build() {
    cd "${pkgname}-${pkgver}"
    python3 -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
