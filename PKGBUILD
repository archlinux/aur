# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.4.0
pkgrel=1
pkgdesc="Program to update personal user details"
arch=('any')
url="https://launchpad.net/mugshot"
license=('GPLv3')
depends=('gtk3' 'python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' 'accountsservice')
makedepends=('python-distutils-extra' 'intltool')
optdepends=('cheese: webcam support'
            'pidgin: update buddy icon'
            'libreoffice: update user details')
options=(!emptydirs)
source=("https://launchpad.net/mugshot/${pkgver%.*}/$pkgver/+download/mugshot-${pkgver}.tar.gz"
        "office-phone.patch"
        "missing_default_face.patch")
sha256sums=('8fe72caca621a8130002bdc298df8e2193bfce356d7db93c5cf83db3787c2045'
            '0cf536fa2ff25327f100d3fd13009cf56aab72cfd56dceda87579974722a212d'
            '787848e6ba8eae35d9d6f15918b16ce6227de632106480c36725e348e715326a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #patch -p1 -i "${srcdir}"/office-phone.patch
  cd "${srcdir}"
  #patch -Np1 -i "${srcdir}"/missing_default_face.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
