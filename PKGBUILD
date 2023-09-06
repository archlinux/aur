# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-wadllib PKGBUILD by ValHue <vhuelamo at gmail dot com>

_name="wadllib"
pkgname=("python-wadllib")
pkgver="1.3.6"
pkgrel="2"
pkgdesc="Python 3 library for navigating WADL files. The Web Application Description Language is an XML vocabulary for describing the capabilities of HTTP resources."
arch=('any')
url="https://launchpad.net/wadllib"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-lazr-uri' 'python-setuptools' 'python-simplejson')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz.asc")
sha256sums=('acd9ad6a2c1007d34ca208e1da6341bbca1804c0e6850f954db04bdd7666c5fc'
            'SKIP')
validpgpkeys=('AC0A4FF12611B6FCCF01C111393587D97D86500B')  # Colin Watson 

prepare() {
    cd "$_name-$pkgver"
    sed -i "s|include_package_data=True|include_package_data=False|g" setup.py 
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
