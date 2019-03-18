# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=3.2.0
epoch=1
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago-bin')
depends=('nodejs' 'libxkbfile' 'libx11')
makedepends=("git" "yarn" 'node-gyp' 'python2' 'libx11' 'rpm-org')
source=("https://github.com/npezza93/archipelago/archive/v$pkgver.tar.gz")
sha512sums=('6a4fbf877b18e00ae057a333165533c1168d009be2c00be8eccb764304b4320734a0d01a6d1511c6dc77e9e745595f9ec16e3a9a980622c75a282ff06807e50f')

build() {
  cd $srcdir/$pkgname-$pkgver
  yarn install --ignore-engines
  yarn run compile
  yarn run build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ar -x dist/*.deb
  tar -xf data.tar.xz
  cp -r {opt/,usr/} $pkgdir/

install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
