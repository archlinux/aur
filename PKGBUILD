# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.10.1
pkgrel=1
pkgdesc='A program to compute the ephemerides'
depends=('python>=3.7.0' 'python<4.0.0'
         'python-kosmorrolib>=0.11.0'
	     'python-termcolor'
         'python-tabulate'
         'python-dateutil'
        )

optdepends=('texlive-bin: PDF creation support'
            'python-latex: PDF creation support')

makedepends=('python-pip' 'python-setuptools' 'python-wheel'
             'ruby-ronn')

arch=('any')
url='https://kosmorro.space'
license=('AGPL3')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/Kosmorro/kosmorro/archive/v${pkgver}.tar.gz")
sha256sums=("35c95a4fd69662229d8e1bb8285e029557e2453e462de0f2a1a4c6672e116e10")

build() {
    pip install --user --isolated Babel

    cd "${srcdir}/kosmorro-${pkgver}"
    make i18n build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
