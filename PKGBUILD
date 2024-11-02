# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=satintel-git
_pkgname="${pkgname%-git}"
pkgver=r63.dbd28b5
pkgrel=1
pkgdesc="OSINT tool for Satellitest to extract satellite telemetry, receive orbital predictions, and parse TLEs"
arch=("any")
url="https://github.com/ANG13T/satintel"
license=("custom")
makedepends=("git" "go")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+$url")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build(){
  cd "$_pkgname"
  go build -o satintel main.go
}

# https://wiki.archlinux.org/title/Go_package_guidelines
package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0755 $srcdir/$_pkgname/satintel "$pkgdir/usr/bin/satintel"
}

