# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname='ubuntu-wallpapers'
pkgver=20.10.2
pkgrel=1
pkgdesc='The default Wallpapers for Ubuntu'
arch=('any')
url='https://launchpad.net/ubuntu-wallpapers'
_pool_url='http://archive.ubuntu.com/ubuntu/pool/main'
license=('custom')
makedepends=('python-distutils-extra' 'python-setuptools')
# http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntu-wallpapers/
source=("${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "${_pool_url}/${pkgname::1}/${pkgname}/${pkgname}_${pkgver}-0ubuntu1.debian.tar.xz")
sha256sums=('3f67abb82cd4b3c60e6d50f6e7278d38cb981d6caaf55d05e98f0c219cda5797'
            '58e154f06ef50dcf77e3e75564d7d2497c0dfc42103bff3ce8a57d2ad421aa1e')

prepare() {
  cd "${pkgname}-${pkgver}"
  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
