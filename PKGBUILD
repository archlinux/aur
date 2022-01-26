# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-cuddle
pkgver=1.0.6
pkgrel=1
pkgdesc="Python implementation of the KDL Document Language"
arch=("any")
url="https://github.com/djmattyg007/python-cuddle"
license=("MIT")
depends=("python" "python-regex" "python-tatsu")
checkdepends=("python-invoke" "python-pytest")
makedepends=("python-poetry-core" "python-build" "python-install")
source=("https://github.com/djmattyg007/python-cuddle/archive/${pkgver}.tar.gz")
sha256sums=("05cc62128198af7c20aa228786de5ebd1402d07d5c7225bdcd2eaf2998ec5e22")

build() {
    cd "python-cuddle-${pkgver}"

    python -m build --skip-dependency-check --no-isolation
}

check() {
    cd "python-cuddle-${pkgver}"

    python -m venv --system-site-packages test-env
    test-env/bin/python -m install --optimize=1 dist/*.whl
    PACKAGING=true test-env/bin/python -m invoke test
}

package() {
    cd "python-cuddle-${pkgver}"

    python -m install --destdir="${pkgdir}" --optimize=1 dist/*.whl

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-cuddle/LICENSE.txt"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-cuddle/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/python-cuddle/CHANGELOG.md"
}
