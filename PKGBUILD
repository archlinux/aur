# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.10.0
pkgrel=1
pkgdesc='A program to compute the ephemerides'
depends=('python>=3.7.0' 'python<4.0.0'
         'python-kosmorrolib>=0.11.0' 'python-kosmorrolib<0.12.0'
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
sha256sums=("b8cba4dcdfe7997d5fa91dde11bf727a05f30b159f0b0e24a1e851205616f992")

build() {
    pip install --user --isolated Babel

    cd "${srcdir}/kosmorro-${pkgver}"
    make i18n build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
