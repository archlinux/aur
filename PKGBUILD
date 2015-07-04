pkgname=arduino-pinoccio
pkgver=2014111401
pkgrel=1
pkgdesc="Arduino libraries for the Pinoccio"
arch=('any')
url="https://pinocc.io"
license=('BSD')
depends=('arduino')
source=("git+https://github.com/Pinoccio/firmware-pinoccio.git#tag=$pkgver"
        "git+https://github.com/Pinoccio/core-pinoccio.git"
        "git+https://github.com/Pinoccio/library-bitlash.git"
        "git+https://github.com/Pinoccio/library-gainspan-s2w.git"
        "git+https://github.com/quartzjer/js0n.git"
        "git+https://github.com/Pinoccio/library-atmel-lwm.git"
        "git+https://github.com/Pinoccio/library-pinoccio.git")

sha1sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd firmware-pinoccio
  git submodule init
  git config submodule.hardware/pinoccio.url "$srcdir/core-pinoccio"
  git config submodule.libraries/bitlash.url "$srcdir/library-bitlash"
  git config submodule.libraries/gainspan.url "$srcdir/library-gainspan-s2w"
  git config submodule.libraries/js0n.url "$srcdir/js0n"
  git config submodule.libraries/lwm.url "$srcdir/library-atmel-lwm"
  git config submodule.libraries/pinoccio.url "$srcdir/library-pinoccio"
  git submodule update
}

package() {
  install -d $pkgdir/usr/share/arduino/libraries/
  install -d $pkgdir/usr/share/arduino/hardware/
  cd $srcdir
  find -type f -exec chmod 644 {} \;
  cp -R  firmware-pinoccio/libraries/* $pkgdir/usr/share/arduino/libraries/
  cp -R  firmware-pinoccio/hardware/*  $pkgdir/usr/share/arduino/hardware/
}
