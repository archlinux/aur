# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=nimlangserver-git
pkgver=v1.12.0.r13.gaa4be4c
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/nim-lang/langserver"
license=('MIT')
depends=('nim>=2.0.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # change into source
  cd "$srcdir/${pkgname%-git}"
  # compile program
  nimble build
}

check() {
  # change into source
  cd "$srcdir/${pkgname%-git}"
  # run all tests
  nimble test
}

package() {
  # create our target filestructure
  mkdir -p "$pkgdir/usr/bin"
  # copy executable
  install -Dm755 "$srcdir/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  # copy license file
  install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
