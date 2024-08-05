# Maintainer: killab33z <killab33z @ protonmail-dot-com>
pkgname=403jump-git
_pkgname="${pkgname%-git}"
pkgver=r23.772eba8
pkgrel=1
pkgdesc="Tool designed to bypass HTTP 403 (Forbidden) pages using various techniques."
arch=("any")
url="https://github.com/trap-bytes/403jump"
license=("MIT")
depends=("git" "go")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+$url")
sha512sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_pkgname
  go build -o 403jump main.go httphandler.go
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm0755 $srcdir/$_pkgname/403jump "$pkgdir/usr/bin/403jump"
}

