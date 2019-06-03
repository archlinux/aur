# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=artful

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=19.04.2
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 18.04)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('324812015f04c7286e9f90d73bb671013fff386eaf7933998a1199ebc24dbd1bba4ca3f8fc526afe4e26df738662d6d033a90f99195380b7fb4cf09feb8e631b'
            '3806dab05de2f3733d36cea7aaced08be400f9302bf72e70977685e3e84b8b135e5d85be64356b4b8f46d1cfcb2be2519d13e05389b592df83e7fc14e9ffd97a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
