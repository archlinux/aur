# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgname=('in-toto')
pkgver=0.3.0
pkgrel=1
pkgdesc="A framework to secure your software supply chain"
arch=('any')
license=('Apache')
url="https://in-toto.io"
depends=('python-cryptography'
    'python-securesystemslib>=0.11.0'
    'python-iso8601'
    'python-attrs'
    'python-dateutil'
    'python-six'
    'python-pathspec')
optdepends=("gnupg: pgp signing/verification")
makedepends=('python' 'python-setuptools' 'git')
checkdepends=('python-mock')
source=("git+https://github.com/${pkgname}/${pkgname}.git?signed#tag=v${pkgver}")

sha256sums=('SKIP')

validpgpkeys=("903BAB73640EB6D65533EFF3468F122CE8162295"
    # Santiago Torres-Arias (upstream co-maintainer)
    "8BA69B87D43BE294F23E812089A2AD3C07D962E8"
    # Lukas Puehringher (upstream maintainer)
    )

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

check() {
    cd "${srcdir}/${pkgname}"
    python tests/runtests.py
}
