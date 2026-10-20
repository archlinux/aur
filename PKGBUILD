# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=crit.md-bin
pkgver=0.23.0
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
            'bf894bf06c91b692805a05d2615e224af5d9bd2c8e0e06fe0caaf66ed3cb6326')
sha256sums_x86_64=('5a953161443fb3c9304a543ff8ca3e07e9a2522b831e3cf2b63c9ed1a01e6902')
sha256sums_aarch64=('3c9a8f11ae3c59fc854f7948ecf4f33f17164d8a4c6afa3fde997c8b153f25bd')

package() {
  case "$CARCH" in
    x86_64) install -Dm755 "crit-$pkgver-linux-amd64" "$pkgdir/usr/bin/crit" ;;
    aarch64) install -Dm755 "crit-$pkgver-linux-arm64" "$pkgdir/usr/bin/crit" ;;
  esac
  install -Dm644 "crit-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "crit-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
