# Contributor: Dmitry V. Luciv <dluciv@dluciv.name>
# Maintainer: Dmitry V. Luciv <dluciv@dluciv.name>

pkgname=haxe3-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="HaXe (pronounced as hex) is an open source programming language, multiple backends, mostly web-targeted."
url="http://haxe.org/"
license=('GPL')
arch=("i686" "x86_64")
options=(!strip)

[[ "$CARCH" = "i686" ]]   && depends=("neko>=2.0.0" "glibc" "zlib") && _platform="linux32"
[[ "$CARCH" = "x86_64" ]] && depends=("neko>=2.0.0" "lib32-glibc" "lib32-zlib") && _platform="linux64"

makedepends=()
conflicts=(haxe-bin haxe)

replaces=("haxe")

# Thanks to haxe authors' delusions and taste
# commaver="${pkgver//./,}"
# Was necessary for 3.1.3 (.../downloads/3,1,3/...), for 3.2.0 haxe authors are sane again

source=(
  "http://haxe.org/website-content/downloads/$pkgver/downloads/haxe-$pkgver-${_platform}.tar.gz"
)

[[ "$CARCH" = "i686" ]] && md5sums=( '11c8303b534d21c20831b9d02f685a16' )
[[ "$CARCH" = "x86_64" ]] && md5sums=( '00c518cbae6ab322c5c23a3875a7b86c' )

build() {
  cd $srcdir
  tar xvzf haxe-${pkgver}-${_platform}.tar.gz
}

package() {
  cd $pkgdir
  mkdir -p usr/bin
  cp $srcdir/haxe-${pkgver}/haxe usr/bin/haxe
  mkdir -p usr/lib/haxe
  cp -r $srcdir/haxe-${pkgver}/std usr/lib/haxe
  cp $srcdir/haxe-${pkgver}/std/tools/haxelib/haxelib usr/bin/haxelib
}
