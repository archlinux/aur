# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-country-list
pkgver=0.2.1
pkgrel=1
pkgdesc='List of all countries with names and ISO 3166-1 codes in all languages'
arch=('any')
url="https://github.com/bulv1ne/country_list"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bulv1ne/country_list/archive/v${pkgver}.tar.gz"
        "data.whl::https://files.pythonhosted.org/packages/fb/1d/7001939f7085679a2b87c1f705e125b0e069430345a0bc1d1af95c024909/country_list-0.2.1-py3-none-any.whl")
sha256sums=('1673bf35921f074424108f98cb2542b88433b795a0f635bd0d5a2213f9e9c0a0'
            'b849f59ce245bacf357c065507c9b8bf56ae3ecaa5f741886991f24345d7c6a6')

package() {
  cd "country_list-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  cp -avR ../country_list/country_data "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/country_list"
}