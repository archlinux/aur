# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Michał Wojdyła
# Contributor: Lex Black
# Contributor: Mikkel Oscar Lyderik

pkgname="python-jenkinsapi"
pkgver=0.3.17
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
sha256sums=('0cd25b85b4a4db38162561970cbff4454bbd2ef205b4077adaa61c69abfe2ef7')
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
