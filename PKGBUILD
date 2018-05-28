# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=2.1.2.r0.g51fee34
_pkgver=2.1.2
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
depends=('nodejs' 'libxkbfile' 'libx11')
makedepends=("git" "yarn" 'node-gyp' 'python2' 'libx11')
source=("git+https://github.com/npezza93/archipelago.git#tag=v$_pkgver")
sha512sums=('SKIP')

pkgver() {
 cd "$pkgname"
 git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/archipelago
  yarn install --ignore-engines
  yarn run dist
}

package() {
  cd $srcdir/archipelago
  ar -x dist/*.deb
  tar -xf data.tar.xz

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
