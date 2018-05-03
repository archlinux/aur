# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=artful

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=18.04.1
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 18.04)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('ad46d79cc32315f67f244bfabb74188478c43374d3021e20d0f0d4182cff7f93920df2fae141257695148dc0d69d8e4e0fa486ac616e6256e9269c8b5d6e06d6'
            'ad753d4cada05f8a3b75d8e22e0fa7a0be3e324abac38382b867ac269399ee7a69ec87c418c2afabb65907aef4b1e68efe63f90c193403d3bc67da35371e4b35')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
