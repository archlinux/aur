# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Falk Alexander Seidl <fa@terminal.run>

pkgname=python-pykeepass-git
_gitname=pykeepass
pkgver=4.0.6
pkgrel=1
pkgdesc="Python library to interact with keepass databases"
arch=("any")
license=("GPL3")
url="https://github.com/libkeepass/pykeepass"
depends=("python-argon2_cffi" "python-construct" "python-dateutil" "python-future" "python-lxml" "python-pycryptodomex")
makedepends=("git" "python-setuptools")
provides=(python-pykeepass)
conflicts=(python-pykeepass)
source=("git+https://github.com/libkeepass/pykeepass.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_gitname}/"
}

package() {
    cd "${srcdir}/${_gitname}/"
    python3 setup.py install --root="${pkgdir}/" --optimize=1
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

