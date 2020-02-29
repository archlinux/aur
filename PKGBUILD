# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=0.13.7
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('any')
url="http://pypi.python.org/pypi/transifex-client"
license=('GPL2')
depends=('python-distribute' 'python-urllib3' 'python-six' 'python-requests'
         'python-slugify')
source=("https://pypi.io/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "python_requirements.patch")
sha256sums=('5570830f40a9436f0a279fe7ab72a636dc0f2efc66fc424b82b7fd6b3f6b260e'
            '532fa165eab30bd0d9c6bd500ca9413b8730828a59a0adb0d201f4b385b37ea1')

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
