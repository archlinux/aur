# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=armory-bin
pkgver=0.93.1
pkgrel=1
pkgdesc="Full-featured Bitcoin wallet (official binary)"
arch=('x86_64')
url="https://bitcoinarmory.com"
license=('AGPL')
depends=(
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
sha256sums=('4fd5fd09cd220972621cd0dab2d815ba9ee4c3f70453ca256e9f8d7a20bb6167')

package() {
  tar xvf data.tar.gz

  # Python 2.
  sed -i 's/python/python2/g' usr/bin/armory
  find usr/lib/ -type f -exec sed -i 's|/usr/bin/python|/usr/bin/python2|g' {} \;
  find usr/lib/ -type f -exec sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' {} \;

  mv usr $pkgdir
}
