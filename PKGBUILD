# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=artful

pkgname=ubuntu-wallpapers
_ubuntu_rel=0ubuntu1
pkgver=17.10.1
pkgrel=1
pkgdesc="The default wallpapers for Ubuntu (from 9.10 to 17.10)"
arch=(any)
url="https://launchpad.net/ubuntu-wallpapers"
license=(GPL)
groups=(unity-extra)
makedepends=(libxslt python2-distutils-extra)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('1f863473079e1c95b9110c7fc18484a15a0215e35e29acb3c48ab5ebff4cab25b2c83e8a8864a2e5df7fd523dc4e519f2c27f0ee4479a64485f854d752942b76'
            'cd373ba1965bd7771bf709399fb32ec188c9a5f7688453ce2703a168501f7c0f0c0d76c67cdfd6e53187a6dc1d9af02e47ffa95290bb1f353ef50d6408ae9ca0')

prepare() {
  cd "${pkgname}-${pkgver}"

  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
