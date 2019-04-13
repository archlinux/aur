# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=0.13.6
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python-distribute' 'python-urllib3' 'python-six' 'python-requests'
         'python-slugify>=1.2.6')
source=("https://pypi.io/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "python_requirements.patch")
sha256sums=('88072f466627aabc55ae058314c70547e111d2d2e0cc91b1e327d65969bed778'
            '5eb90fe23f82da6ee9b92f596cba6f5d80c300696f9f0606e2ac093c897d8dd8')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/python_requirements.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
