# Maintainer: David McInnis <dave@dave3.xyz>
# Contributor:  jyantis <yantis@yantis.net>

pkgname=python-internetarchive
pkgver=1.8.1
pkgrel=1
pkgdesc='Wrapper for the various Internet Archive APIs (IA-S3, Metadata API, etc)'
arch=('any')
url='https://github.com/jjjake/ia-wrapper'
license=('AGPL3')
depends=('python'
         'python-setuptools'
         'python-clint'
         'python-six'
         'python-yaml'
         'python-requests'
         'python-jsonpatch'
         'python-pytest'
         'python-docopt'
         'python-jsonpointer'
         'python-args'
         'python-backports.csv'
         'python-schema'
        )
optdepends=('python-ujson: faster json parsing'
            'python-gevent: concurrent downloads'
            'cython: speedups')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jjjake/internetarchive/archive/v${pkgver}.tar.gz")
sha256sums=('9db8b179434521345a93a01e73669b9fd9a8949f8a75b52fcf22f3de865229c7')
provides=('python-internetarchive')
conflicts=('python-internetarchive-git' 'python2-internetarchive-git')

build() {
  cd internetarchive-${pkgver}
  python setup.py build
}

package() {
  cd internetarchive-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:

