# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=ubuntu-wallpapers
pkgver=20.04.2
pkgrel=1
pkgdesc='The default Wallpapers for Ubuntu'
arch=(any)
url='https://launchpad.net/ubuntu-wallpapers'
license=('custom')
makedepends=('libxslt' 'python2-distutils-extra')
source=("http://archive.ubuntu.com/ubuntu/pool/main/u/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/main/u/${pkgname}/${pkgname}_${pkgver}-0ubuntu1.debian.tar.xz")
sha256sums=('c89d53a769967edce106fb6b431e35ee1e3a14a91aa50545ff72b5c8159737ee'
            'cf9f2ab08a2efaab369289ecb63fd098c46978648d4c68a38a4571b34244fade')

prepare() {
  cd "${pkgname}-${pkgver}"
  # The setup.py script reads the package version from debian/*
  ln -s ../debian .
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
