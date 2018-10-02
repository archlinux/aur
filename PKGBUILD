# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pytype
pkgver=2018.9.19
pkgrel=1
pkgdesc="Python type inferencer"
arch=('any')
url="https://github.com/google/pytype"
license=('APACHE')
provides=('pytype')
depends=('python-importlab'
         'python-yaml>=3.11')
makedepends=('python' 'python-setuptools' 'python-wheel'
             'make' 'gcc' 'cmake')
options=(!emptydirs)
source=("https://github.com/google/pytype/archive/${pkgver}.tar.gz"
        "cpython-9734024.zip::https://github.com/python/cpython/archive/9734024ec65311e33936faa83fb1cb249ef0de9d.zip"
        "googletest-e82d320.zip::https://github.com/google/googletest/archive/e82d320567a45db1a999f9109f2b9a733bc59bb1.zip"
        "typeshed-4f4a025.zip::https://github.com/python/typeshed/archive/4f4a025409dc4037a35a46c8a57b75a384d05fe5.zip"
        )
sha256sums=('17ff808c72204745e416c8c5a299cc9e1180c93dc5e80d872369a40d49a3ba52'
            'ebc3b63747875586f17b967ad2dae6d2a404adb5814612200217f39074377f9a'
            '891d732c77eec9fb57727cd99990a25455d6d5859b1fde107a332c5e238cc9e7'
            '2d1acebe006efae35141a1ede6411da2e9895c2231eb38ec8cc5b9faefaa38b7'
            )

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  rm -rf googletest/
  ln -s "${srcdir}/googletest-e82d320567a45db1a999f9109f2b9a733bc59bb1" googletest

  rm -rf cpython/
  ln -s "${srcdir}/cpython-9734024ec65311e33936faa83fb1cb249ef0de9d" cpython

  rm -rf typeshed/
  ln -s "${srcdir}/typeshed-4f4a025409dc4037a35a46c8a57b75a384d05fe5" typeshed

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 DESCRIPTION.rst "${pkgdir}/usr/share/doc/${pkgname}/DESCRIPTION.rst"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
