# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=utopic

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=16.04.1
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 16.04)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
install=${pkgname}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('0e21dc860d824d0fe89202391cb5109a5e57e10708f0a13c8fa953a5b11e4c83db0ccf1e6dd1d5fc93dcb385ec0a792e059ef221d47d411050dd9b6973bf67bd'
            'cfb11b4e86e54d3e98def23985f096af4662ca286d6423bf73350f3678d361c45ab82c77683881eb31371be33037918f65ae9b5e763afae3342ed55bba454d65')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
