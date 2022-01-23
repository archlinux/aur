# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Nathan Owens <ndowens @ artixlinux.org>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=python-tatsu
pkgver=5.7.3
pkgrel=1
pkgdesc="TatSu takes a grammar in a variation of EBNF as input, and outputs a memoizing PEG/Packrat parser in Python."
arch=("any")
url="https://github.com/neogeny/TatSu"
license=("BSD")
depends=("python")
optdepends=("python-regex")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/T/TatSu/TatSu-${pkgver}.zip")
sha256sums=("cf1f3b16fc4f8c8f4d0135749407dc01c10051c34ce1f6c7e859867d89b5ac69")

build() {
    cd "TatSu-${pkgver}"

    python setup.py build
}

package() {
    cd "TatSu-${pkgver}"

    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0], end='')")

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    rm -r "${pkgdir}${_site_packages}/test"
    chmod -R o+r "${pkgdir}${_site_packages}/"*.egg-info

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-tatsu/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-tatsu/README.rst"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-tatsu/CHANGELOG.rst"
}
