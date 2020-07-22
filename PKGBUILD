# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-b2sdk
_pkgname=b2-sdk-python
pkgver=1.1.4
pkgrel=1
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
sha256sums=('230d88d1368345f0175c1df3c4e8225b4e481b97263ed3bb1e24eb5b9c204a76')

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
