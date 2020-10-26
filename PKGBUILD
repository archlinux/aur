# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname='ubuntu-wallpapers'
pkgver=20.10.3
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
sha256sums=('03582c2ffbdfff7d7e2f5a2b714221ae4aacc59e688306c1edf495ede258269d'
            'cc3d8ccfab12e6f6ff992c449227620e9ef76d44dc25b481010fcafa987e90a3')

prepare() {
  cd "${pkgname}-${pkgver}"
  # The setup.py script reads the package version from debian/*
  ln -sfv ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dvm644 'debian/copyright' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
