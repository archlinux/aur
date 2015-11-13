# Maintainer: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.3.0
pkgver_min=${pkgver%.*}
pkgrel=5
pkgdesc="Program to update personal user details"
arch=('any')
install="${pkgname}.install"
url="https://launchpad.net/mugshot"
license=('GPLv3')
depends=('python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' 'python-distutils-extra')
optdepends=( 'gstreamer0.10-good-plugins: webcam support'
             'pidgin: update buddy icon'
             'libreoffice: update user details'
             'accountsservice: user image management without ~/.face'
)
options=(!emptydirs)

source=("https://launchpad.net/mugshot/$pkgver_min/$pkgver/+download/mugshot-${pkgver}.tar.gz" "office-phone.patch")
md5sums=('526722e9985ad86771fd60cdf0bee985' 'e4ea8f6762f9c3e4023ca73e4fc32a62')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i $srcdir/office-phone.patch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root "${pkgdir}"
}
