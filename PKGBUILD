# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Maintainer: <michael@michaels.world>

pkgname='python-hkdf'
pkgver=0.0.3
pkgrel=6
pkgdesc="HMAC-based Extract-and-Expand Key Derivation Function"
arch=('any')
url="https://github.com/casebeer/python-hkdf"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "${pkgname}-tests.py::https://raw.githubusercontent.com/casebeer/python-hkdf/cc3c9dbf0a271b27a7ac5cd04cc1485bbc3b4307/tests.py"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/casebeer/python-hkdf/cc3c9dbf0a271b27a7ac5cd04cc1485bbc3b4307/LICENSE")
sha512sums=('c58f9310c151f8d710998d019221713ec71ac8083c42300f5e77326c7b35be341263c40fb485402937c381a6435cbd9899c8d32846a50d1d1e6a4d3e61f58c7d'
            'd7568f824f777782679cf76dd380f836a5b74b5b928e6b27bbb6a95d8d28a5918d7eba8cbd7326d0746dac0c7f84f461b553bc9b3969be2c17dd15798d8002ec'
            'ac83e533344497e13462d3563bc02e422ee339e950d7212d9cedbf89862343e4873e0c833dcbfa9259e3affa7e58a346793dc011b9ce2c24743611f379f89cdb')
b2sums=('25786395ad7f87db5420adb4891821adf52e5eaf8098ca502aad16a69c75bbc5dedc2b8dfddee76a545e91f4900c1a0bfbe94d79822cd529e72474c65ee194d6'
        'b43b6377d5b1cc830d0108d14314324ef58e52a5ef5b158250a261852791669d11e68c2233f65b78d49ff0e934a370f832d893db3d69251b3b22b523a126ed6e'
        'f383b1e67c0ce1700d175506db5e2becc2cb1bb4994245a16444a7884b8aea7476e86871b68e39cdba8c9b76a676daf7bdd6a403377d66e960d7f0316150ab07')

prepare() {
  cd "${pkgname#python-}-${pkgver}"
  mv -vf ../${pkgname}-tests.py tests.py
}

build() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname#python-}-${pkgver}"
  nosetests
}

package() {
  cd "${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -vDm 644 ../${pkgname}-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
