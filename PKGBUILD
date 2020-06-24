# Maintainer: Marcel Schramm <marcelschr@protonmail.com>

pkgname=cordless-git
pkgver=2020.06.24
pkgrel=1
pkgdesc='A Discord TUI client.'
arch=('x86_64')
url="https://github.com/Bios-Marcel/cordless"
license=('BSD-3')
source=("$pkgname::git+https://github.com/Bios-Marcel/cordless.git")
makedepends=('glibc' 'go')
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags `git rev-list --tags --max-count=1` | sed 's/-/./g'
}

build() {
  cd "$pkgname"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/cordless
}
