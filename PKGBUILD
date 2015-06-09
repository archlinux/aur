# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=utopic

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=15.04.1
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 Karmic Koala to 14.10 Utopic Unicorn)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
install=${pkgname}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('0e878a823ff6b758294b8e4522b076e0f18d62c820fc6cbe3a96624a4b60fe23da2a918ad278afbad83380bc14457dc30fbeb2837a563f473ea5e5b382894c7d'
            '0d0c90f70850dffb59a96c6297936d7faaa12cff448ddd43d05cf4a3959e6bed6e1e37d94be9700dd88adb7cf63761047d1c4fb6ae54d270477cd7dd5b43378b')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
