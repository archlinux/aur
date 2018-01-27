# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>

pkgname=laditools
pkgver=1.1.0
pkgrel=1
pkgdesc="Utilities to improve integration and workflow with JACK and LASH."
arch=('any')
url="https://github.com/LADI/laditools"
license=('GPL3')
depends=('glade' 'jack' 'pygtk' 'python2' 'python2-enum34' 'python2-yaml')
makedepends=('git' 'python2-distutils-extra')
source=("https://github.com/alessio/laditools/archive/v${pkgver}.tar.gz"
        "enum34.diff")
sha512sums=('7f56d669cc1e468e0aa68b541f0da8b98cfdcceb6fd9e55a054d7622c4066f6422d367034697a4838bcd2f2caf14a1281f66b70f6ff4adff7de3c91f51f1bcdb'
            'b406924a4b59ec15e7db4af926d7ec1e8c8802cede7d77d8d524592aa99c858e24cc9ce5f513d592dbecb9f3614404250e5a7963425d00b435cd8f6eb103a362')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/enum34.diff
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
