# Maintainer: upi@mis.my.id
pkgname=wewbo
pkgver=0.9.3
pkgrel=1
pkgdesc="Interactive terminal application for streaming and downloading anime"
arch=('x86_64')
url="https://github.com/upi-0/wewbo"
license=('GPL3')
depends=('mpv' 'ffmpeg')
makedepends=('curl' 'git')   # build deps
source=("https://github.com/upi-0/wewbo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
build() {
  cd "$srcdir/wewbo-${pkgver}"

  # Install choosenim
  curl https://nim-lang.org/choosenim/init.sh -sSf | sh

  # install dep via nimble from choosenim
  ~/.nimble/bin/nimble install illwill htmlparser malebolgia --installDeps --yes

  # compile binary
  ~/.nimble/bin/nimble build -y
}
package() {
  cd "$srcdir/wewbo-${pkgver}"

  install -Dm755 "wewbo" "$pkgdir/usr/bin/wewbo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
