# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=armory-bin
pkgver=0.93.3
pkgrel=1
pkgdesc="Full-featured Bitcoin wallet (official binary)"
arch=('x86_64')
url="https://bitcoinarmory.com"
license=('AGPL')
depends=(
  'bitcoin-daemon'
  'crypto++'
  'python2'
  'python2-pyqt4'
  'python2-twisted'
  'python2-psutil'
  'swig'
  'xdg-utils'
)
conflicts=('armory' 'armory-git')

# Don't blindly trust a random AUR package with your coins! Signed hashes available at
# https://bitcoinarmory.com/download/ with GPG ID 0x98832223
source=("https://s3.amazonaws.com/bitcoinarmory-releases/armory_${pkgver}_ubuntu-64bit.deb")
sha256sums=('89a28d7b4c262abc31bb09696e368a0ed633a1d9c7f8bf8922814014258f78d5')

package() {
  tar xvf "$srcdir/data.tar.xz"

  # Python 2.
  sed -i 's/python/python2/g' usr/bin/armory
  find usr/lib/ -type f -exec sed -i 's|/usr/bin/python|/usr/bin/python2|g' {} \;
  find usr/lib/ -type f -exec sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' {} \;

  mv usr $pkgdir
}
