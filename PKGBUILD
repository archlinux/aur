# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgbase=secsend
pkgname=("${pkgbase}-api" "${pkgbase}-cli" "${pkgbase}-webapp")
pkgver=1.0.0
pkgrel=1
pkgdesc='A file-sharing app providing end-to-end encryption of data'
url='https://github.com/aguinet/secsend'
makedepends=('python' 'npm')
arch=('any')
license=('GPL3')
source=("https://github.com/aguinet/${pkgbase}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b49fabe29820a7eb79d0b9fe35f043f05aecb5d00c2941bb94eb5569f8733b53')

build() {
  cd "${pkgbase}-${pkgver}"
  for d in api cli webapp; do
    cd $d
    python setup.py build
    cd ../
  done
}

package_secsend-api() {
  depends=(
    'python-jsonschema'
    'python-sanic'
  )
  cd "${pkgbase}-${pkgver}/api"
  python setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
}

package_secsend-cli() {
  depends=(
    'python-requests'
    'python-magic'
    'python-cryptography'
    'python-progressbar'
  )
  cd "${pkgbase}-${pkgver}/cli"
  python setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
}

package_secsend-webapp() {
  cd "${pkgbase}-${pkgver}/webapp"
  python setup.py install -O1 --skip-build --root="${pkgdir}" --prefix=/usr
}

# vim: ts=2 sw=2 et:
