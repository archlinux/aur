# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=utopic

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=17.04.1
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 16.04)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('730efe559be438fb673d41998bced8f1d7188b14b630f2f92789a01aa8879d77998f353c8cc1b1150800b192aa6c6cbab3473b68fc90e42284db15d25aa875b7'
            'fc58f01e3acca236adce2576267512c53ae97d73df4a2a5618212f7caf3d957eaeb1994d6229b8e86fd5a3725298f22422fa25e58bf4b8ecf6665f1633a98961')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
