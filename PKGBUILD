# Maintainer: Slava Ganzin <slava.ganzin@gmail.com>

pkgname=await-git
pkgver=0.99
pkgrel=1
pkgdesc="28kb small memory footprint single binary that run list of commands in parallel and waits for their termination"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'gcc' 'make')
url="https://await-cli.app/"
license=('MIT')
source=(git+https://github.com/slavaGanzin/await)
sha256sums=('SKIP')
provides=('await')
conflicts=('await')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format=format:'%as-%f' | tr - .
}

build() {
  cd ${pkgname%-git}
  ./build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing executables...'
  install -Dm 755 await -t "$pkgdir"/usr/bin

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

