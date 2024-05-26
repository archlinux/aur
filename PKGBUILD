# Maintainer: Infernio <infernio at icloud dot com>
pkgname=pe-set-laa-git
pkgver=r2.5b9a561
pkgrel=1
pkgdesc="Set LARGE_ADDRESS_AWARE flag to PE executable files"
arch=(x86_64)
url="https://github.com/randomstuff/pe-set-laa"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'git')
source=("$pkgname::git+https://github.com/randomstuff/pe-set-laa.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  gcc pe-set-laa.c -o pe-set-laa
}

package() {
  cd "$pkgname"

  install -Dm755 pe-set-laa "${pkgdir}/usr/bin/pe-set-laa"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
