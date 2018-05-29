# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=scala-cli-tools
pkgver=0.2.0
pkgrel=1
pkgdesc="collection of command-line tools written in Scala"
arch=('i686' 'x86_64')
url="https://github.com/wookietreiber/scala-cli-tools"
license=('GPL')
depends=('gc' 'libunwind' 're2')
makedepends=('clang' 'sbt')
conflicts=('hl-git' 'highlight-wookietreiber')
provides=('highlight-wookietreiber')
replaces=('highlight-wookietreiber')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wookietreiber/scala-cli-tools/archive/v$pkgver.tar.gz")
md5sums=('1d58efe82c98758083a5799f24112867')

package() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  PREFIX=$pkgdir/usr NATIVE_MODE=release \
    sbt \
      -ivy /tmp/makepkg/.ivy2 \
      -sbt-dir /tmp/makepkg/.sbt \
      install
}
