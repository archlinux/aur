# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Michał Wojdyła
# Contributor: Lex Black
# Contributor: Mikkel Oscar Lyderik

pkgname="python-jenkinsapi"
pkgver=0.3.20
pkgrel=1
pkgdesc="Python API for accessing resources on a Jenkins continuous-integration server"
arch=('any')
url="https://github.com/pycontribs/jenkinsapi"
license=('MIT')
makedepends=(
    "git"
    "python-build"
    "python-hatch"
    "python-installer"
)
depends=(
    "python"
    "python-urllib3"
    "python-requests"
    "python-pytz"
)
optdepends=("python-requests-kerberos: for Kerberos support")
source=("git+https://github.com/pycontribs/jenkinsapi.git#tag=$pkgver")
sha256sums=('841862dc32cc670f103c098f6af5ad5a6ccf60acad21b10a6aa7194a3aad00b9')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')  # Github

build() {
    cd jenkinsapi
    python -m build --no-isolation --wheel
}

package() {
    cd jenkinsapi
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
