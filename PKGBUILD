pkgname=markpad
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="Lightweight GTK3 markdown editor/viewer"
arch=('x86_64')
url="https://github.com/Twilight0/MarkPad"
license=('MIT')
depends=('gtk3')
makedepends=('git' 'gcc' 'make' 'pkgconf')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || {
    echo "0.r0.g0000000"
    return
  }

  local describe
  local rev
  local hash

  describe="$(git describe --tags --long 2>/dev/null || true)"
  if [[ -n "$describe" ]]; then
    sed 's/^v//;s/-/./g' <<<"$describe"
    return
  fi

  rev="$(git rev-list --count HEAD 2>/dev/null || echo 0)"
  hash="$(git rev-parse --short HEAD 2>/dev/null || echo 0000000)"
  echo "0.r${rev}.g${hash}"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
