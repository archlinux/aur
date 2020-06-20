# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: whoami <whoami@systemli.org>
# Contributor: Jefferson González <jgmdev@gmail.com>
# Contributor: Chloe Kudryavtsev <toast@toastin.space>

pkgname=vlang-git
pkgver=0.1.27.r717.gb3fc462a7
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software. Compiles itself in <1s with zero dependencies'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
depends=('glibc')
makedepends=('git')
optdepends=('glfw-x11: Needed for graphics support'
      'freetype2: Needed for graphics support'
      'openssl: Needed for http support')
conflicts=('vlang')
source=('vlang::git+https://github.com/vlang/v')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/v"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/v"
  make
}

package() {
  cd "${srcdir}/v"
  install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 v "$pkgdir/usr/lib/vlang"
  cp -a cmd "$pkgdir/usr/lib/vlang/"
  chmod -R 777 "$pkgdir/usr/lib/vlang/cmd"
  cp -a examples "$pkgdir/usr/share/vlang/"
  cp -a thirdparty "$pkgdir/usr/lib/vlang/"
  cp -a vlib "$pkgdir/usr/lib/vlang/"
  ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}