# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=gitakc
pkgver=0.1
_scalaversion=3.0.0
pkgrel=4
pkgdesc="A small program to use user's GitHub keys for ssh authorization."
arch=('any')
url="https://github.com/sequencer/gitakc"
depends=('bash' 'java-runtime-headless')
makedepends=('mill')
source=("https://github.com/sequencer/gitakc/archive/refs/tags/$pkgver.tar.gz")
b2sums=('54672160f2278ac3b663402b4b32b5d570cef10a0d4fed49c47d85d150704add07e515d97b4e4deeb42a4b7705e29fa87b743129322be9421bb2eb21dc3f07ff')
install="gitakc.install"

prepare() {
  cd gitakc-$pkgver
  sed -i 's|\"sequencer\"|// &|' gitakc/resources/test.json
}

build() {
  cd gitakc-$pkgver
  mill -i gitakc.jvm[$_scalaversion].assembly
}

package() {
  cd gitakc-$pkgver
  install -Dm755 out/gitakc/jvm/$_scalaversion/assembly.dest/out.jar "$pkgdir"/usr/bin/gitakc
  install -Dm644 gitakc/resources/test.json "$pkgdir"/etc/gitakc.json
}
