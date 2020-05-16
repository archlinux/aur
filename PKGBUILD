# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>
# Maintainer: Alexander Neumann <alexander@bumpern.de>
options=(!strip)
pkgname=grobi-git
pkgver=r123.fd80d7f
pkgrel=1
pkgdesc="grobi automates applying xrandr profiles when outputs change"
arch=('i686' 'x86_64')
url="https://github.com/fd0/grobi"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go>=1.4')
provides=('grobi')
conflicts=('grobi')
source=("${pkgname}::git+https://github.com/fd0/grobi")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)";
}

build() {
  cd "$pkgname"
  go build
}

package() {
  install -Dm755 "$pkgname/grobi"    "$pkgdir/usr/bin/grobi"
  install -Dm644 "$pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "$pkgname/doc/grobi.service" "$pkgdir/usr/lib/systemd/user/grobi.service"
  install -Dm644 "$pkgname/contrib/grobi.bash" "$pkgdir/usr/share/bash-completion/completions/grobi"
}

# vim:set ts=2 sw=2 et:
