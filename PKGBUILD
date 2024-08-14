# Maintainer: Catty Steve <cattysteve89265@163.com>
# Contributor: Haruue Icymoon <haruue@caoyue.com.cn>

pkgname=ncmdump-git
_basename="${pkgname%-git}"
pkgver=1.3.2 # pkgver is updated due to upstream change
pkgrel=1
epoch=2
pkgdesc='Convert Netease Cloud Music ncm files to mp3/flac files.'
arch=('any')
url='https://github.com/taurusxin/ncmdump'
conflicts=("$_basename")
provides=("$_basename")
license=('MIT')
makedepends=('git')
source=("$_basename"::'git+https://github.com/taurusxin/ncmdump')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_basename"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_basename"
  cmake -DCMAKE_BUILD_TYPE=Release -B build
  cmake --build build -j 8
}

package() {
  install -Dm755 "$srcdir/$_basename/build/ncmdump" "$pkgdir/usr/bin/ncmdump"
}

# vim:set ts=8 sts=2 sw=2 et:
