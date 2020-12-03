# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.4.2
pkgrel=2
pkgdesc="Program to update personal user details"
arch=('any')
url="https://github.com/bluesabre/mugshot"
license=('GPLv3')
depends=('gtk3' 'python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' 'accountsservice')
makedepends=('python-distutils-extra' 'intltool')
optdepends=('cheese: webcam support'
            'pidgin: update buddy icon'
            'libreoffice: update user details')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgname}-${pkgver}.tar.gz"
        'https://github.com/bluesabre/mugshot/commit/4f6c280f43261b45f16dea348d33bb3bf02e3ca1.patch')
sha256sums=('05698a36494405b5a76be0bf92e89a87fec4e3e6e6168378833de160c9741c84'
            '087086eae1e453bf1e4626e0facdc5967f2ac1e43c1d75f73e5de1fda0bf69d6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  # Python 3.9 fix
  patch -Np1 -i ../4f6c280f43261b45f16dea348d33bb3bf02e3ca1.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
