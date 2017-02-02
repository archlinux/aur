# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=utopic

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=16.10.2
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 16.04)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('224778670db30cd39edd4813e1b22d74c21617d3262ba670d8c979a5859ad2f8433bb39329940286e091d73fe03d4959593e321bdcd86b452561ae2569558c04'
            '0a0134de1440ec21c4df2fc6b6c21e063e3a08344ccf3293f42447cb72dddee0ad1e362e49a97c2c32d9b70a7783b2c396c79c7b35c7151da474cfdcb5580fe1')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
