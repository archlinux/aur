# Maintainer:

pkgname=ubuntu-emulator
pkgver=0.34
pkgrel=1
pkgdesc="Create and destroy Ubuntu Touch instances and run them with the emulator"
url="https://launchpad.net/goget-ubuntu-touch"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('android-tools')
makedepends=('go' 'bzr')
provides=('ubuntu-emulator')
conflicts=('ubuntu-emulator')
# options='!emptydirs'
source=("https://launchpad.net/ubuntu/+archive/primary/+files/goget-ubuntu-touch_${pkgver}.orig.tar.gz")
md5sums=('b8bddb2db18d1b47098bb94531b23c78')

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
