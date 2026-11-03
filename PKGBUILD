# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=crit.md-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="Review agent plans, diffs, and web apps in the browser"
arch=("x86_64" "aarch64")
url="https://github.com/tomasz-tomczyk/crit"
license=("MIT")
depends=("git")
depends_x86_64=("glibc")
optdepends=("xdg-utils: open reviews in the default browser")
provides=("crit.md=$pkgver")
conflicts=("crit.md" "crit" "crit-bin" "crit-git")
options=("!strip" "!debug")

source=(
  "crit-$pkgver-LICENSE::https://raw.githubusercontent.com/tomasz-tomczyk/crit/v$pkgver/LICENSE"
  "crit-$pkgver-README.md::https://raw.githubusercontent.com/tomasz-tomczyk/crit/v$pkgver/README.md"
)
source_x86_64=("crit-$pkgver-linux-amd64::$url/releases/download/v$pkgver/crit-linux-amd64")
source_aarch64=("crit-$pkgver-linux-arm64::$url/releases/download/v$pkgver/crit-linux-arm64")
noextract=("crit-$pkgver-linux-amd64" "crit-$pkgver-linux-arm64")

sha256sums=('2cf35fdedf349b666381d909b857baf5641314024edf7064e16d553c59f67345'
            '226fa475c452a355dd520a8a266a5395a8a3fce90521c9d774a62ec15fabd2f9')
sha256sums_x86_64=('10aa756a3146362be3a349cc8223955e23a1cd6daa0abbb13dd500741f793a90')
sha256sums_aarch64=('fc1cc46624d5573157336e96bc3b93c965cd649eb8168f966b8b93f77c0b4072')

package() {
  case "$CARCH" in
    x86_64) install -Dm755 "crit-$pkgver-linux-amd64" "$pkgdir/usr/bin/crit" ;;
    aarch64) install -Dm755 "crit-$pkgver-linux-arm64" "$pkgdir/usr/bin/crit" ;;
  esac
  install -Dm644 "crit-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "crit-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
