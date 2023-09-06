# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-lazr-restfulclient PKGBUILD by ValHue <vhuelamo at gmail dot com>

_name="lazr.restfulclient"
pkgname=("python-lazr-restfulclient")
pkgver="0.14.5"
pkgrel="1"
pkgdesc="A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib."
arch=('any')
url="https://launchpad.net/$_name"
license=('LGPL3')
makedepends=('python-build' 'python-wheel' 'python-installer'  'python-setuptools')
depends=('python-lazr-uri' 
         'python-six' 
         'python-distro' 
         'python-setuptools'
		 'python-httplib2>=0.7.7' 
         'python-wadllib>=1.1.4' 
         'python-oauthlib')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_name/trunk/$pkgver/+download/$_name-$pkgver.tar.gz.asc")
sha256sums=('0751717c7e74db1987e9a77335707d4d7d97cf04b1ad0898b822f12333d6887c'
            'SKIP')
validpgpkeys=('AC0A4FF12611B6FCCF01C111393587D97D86500B') 

#~build() {
    #~cd "${srcdir}/${_name}-${pkgver}"
    #~python setup.py build
#~}

#~package() {
    #~cd "${srcdir}/${_name}-${pkgver}"
    #~python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
#~}

prepare() {
    cd "$_name-$pkgver"
    sed -i "56d" setup.py 
    sed -i "s|find_packages('src')|['lazr.restfulclient']|g" setup.py 
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
