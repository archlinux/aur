# Maintainer: David McInnis <dave@dave3.xyz>
# Contributor:  jyantis <yantis@yantis.net>

pkgname=python-internetarchive
pkgver=1.7.3
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
        )
optdepends=('python-ujson: faster json parsing'
            'python-gevent: concurrent downloads'
            'cython: speedups')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jjjake/internetarchive/archive/v${pkgver}.tar.gz")
sha256sums=('f62790747385f04a04de78f71219d68e9aeb2fd88b41132a4087be722b9aa13e')
provides=('python-internetarchive')
conflicts=('python-internetarchive-git' 'python2-internetarchive-git')

build() {
  cd internetarchive-${pkgver}

  # Patch requirments.txt from == to >=
  sed -i 's/==/>=/g' setup.py

  python setup.py build
}

check() {
  cd internetarchive-${pkgver}
  python setup.py test --verbose
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

