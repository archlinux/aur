# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.3.2
pkgrel=3
pkgdesc="Program to update personal user details"
arch=('any')
url="https://launchpad.net/mugshot"
license=('GPLv3')
depends=( 'python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' )
makedepends=( 'python-distutils-extra' )
optdepends=( 'cheese: webcam support'
             'pidgin: update buddy icon'
             'libreoffice: update user details'
             'accountsservice: user image management without ~/.face'
)
options=(!emptydirs)
sha256sums=('ee3debca912c6ddbba613531ab0856496dd247a1f084740ba48cbf42b364c7f0'
            '0cf536fa2ff25327f100d3fd13009cf56aab72cfd56dceda87579974722a212d'
            '787848e6ba8eae35d9d6f15918b16ce6227de632106480c36725e348e715326a')

source=("https://launchpad.net/mugshot/${pkgver%.*}/$pkgver/+download/mugshot-${pkgver}.tar.gz"
        "office-phone.patch"
        "missing_default_face.patch")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}"/office-phone.patch
    cd "${srcdir}"
    patch -Np1 -i "${srcdir}"/missing_default_face.patch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root "${pkgdir}"
}
