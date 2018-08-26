# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=2.3.2
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
sha512sums=('bcdd117916c2b28d542b98f9b039277cba4b54ffbeba6006c636ad086cd2fb3511a206b6a2815822f8ea1b9b71b8120ba79258b3f0a8d9dcf5806469548eb954')

build() {
  cd $srcdir/$pkgname-$pkgver
  yarn install #--ignore-engines
  ./node_modules/.bin/electron-builder --linux deb
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
