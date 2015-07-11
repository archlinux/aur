# Maintainer: Oliver Kuster <oliver.kuster[at]gmail[dot]com>
pkgname=ubuntu-device-flash
pkgver=0.4+14.10.20141002
pkgrel=3
pkgdesc="Flash supported Nexus devices with Ubuntu."
url="http://packages.ubuntu.com/trusty/devel/ubuntu-device-flash"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('android-tools' 'sudo' )
makedepends=('go' 'bzr')
# options='!emptydirs'
source=(
"https://launchpad.net/ubuntu/+archive/primary/+files/goget-ubuntu-touch_${pkgver}.orig.tar.gz"
)
md5sums=('3dca7517e95af8348f191137d6ed8bac')

build() {
  export GOPATH="$srcdir/build"

  cd $srcdir/goget-ubuntu-touch-${pkgver}/${pkgname}

  #download deps
  echo "go get: downloading dependencies..."
  go get -v -d

  echo "go build: building executable..."
  # Prepare executable
  go build
}

package() {
  SOURCE_PATH="$srcdir/goget-ubuntu-touch-${pkgver}"
  # Package license (if available)
  install -Dm644 "$SOURCE_PATH/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Package executables
  install -Dm755 "$SOURCE_PATH/${pkgname}/${pkgname}" \
    "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
