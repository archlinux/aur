# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.10.9
pkgrel=1
pkgdesc='A program to calculate the ephemerides'
depends=(
    'python'
    'python-kosmorrolib>=1.0.0'
    'python-termcolor'
    'python-tabulate'
    'python-dateutil'
)

optdepends=(
    'texlive-bin: PDF creation support'
    'python-latex: PDF creation support'
)

makedepends=(
    'python-pip'
    'python-setuptools'
    'python-wheel'
    'python-babel'
    'ruby-ronn'
)

arch=('any')
url='https://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/Kosmorro/kosmorro/tar.gz/v$pkgver")
sha256sums=("910109c4f8f6816e4f92f45f8fee63b5f47defb92b781ce26e0f1cfc2ed92f77")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    pybabel compile -d _kosmorro/locales
    make build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
