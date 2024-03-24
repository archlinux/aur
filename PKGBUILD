# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

pkgname=python-pykeepass-git
_gitname=pykeepass
pkgver=4.0.7.r4.ge43ca6c # renovate: datasource=github-tags depName=libkeepass/pykeepass
pkgrel=1
pkgdesc="Python library to interact with keepass databases"
arch=("any")
license=("GPL3")
url="https://github.com/libkeepass/pykeepass"
depends=("python-argon2_cffi" "python-construct" "python-dateutil" "python-future" "python-lxml" "python-pycryptodomex" "python-setuptools")
makedepends=("git" "python-build" "python-installer" "python-wheel")
provides=(python-pykeepass)
conflicts=(python-pykeepass)
source=("git+https://github.com/libkeepass/pykeepass.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^pykeepass\.//'
}

build() {
    cd "${srcdir}/${_gitname}/"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_gitname}/"
    python -m unittest tests.tests
}

package() {
    cd "${srcdir}/${_gitname}/"
    python3 -m installer --destdir="${pkgdir}" dist/*.whl
}

