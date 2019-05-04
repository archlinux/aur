# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-b2sdk
_pkgname=b2-sdk-python
pkgver=0.1.6
pkgrel=2
pkgdesc='Python library to access B2 cloud storage.'
arch=(any)
url='https://github.com/Backblaze/b2-sdk-python'
license=('MIT')
depends=('python'
         'python-arrow>=0.8.0'
         'python-logfury>=0.1.2'
         'python-requests>=2.9.1'
         'python-setuptools'
         'python-six>=1.10'
         'python-tqdm>=4.5.0'
        )

source=(https://github.com/Backblaze/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('331b16d42e4cc6da27d2e0eae13ae34b69a3e53d5a71209fb9329dd351eb00dd')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # This requriement seems overly complex, losen the
  sed -i -e 's:\(arrow>=.*\),<0\.13.*:\1<=0.13.*:' requirements.txt

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
