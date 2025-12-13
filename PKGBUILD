# Maintainer: CWZMorro <cwzmorro@gmail.com>
pkgname=swap-os-git
_pkgname=swap-OS
pkgver=v1.0.0.r3.g0e82cbf
pkgrel=1
pkgdesc="A tool to enable seemless swap between different OS"
arch=('any')
url="https://github.com/CWZMorro/swap-OS"
license=('MIT')
depends=('efibootmgr')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/CWZMorro/swap-OS.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Automatically grabs the version from git commits
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # 1. Install the script and rename it to 'swapos'
  install -Dm755 swapos.sh "$pkgdir/usr/bin/swapos"

  # 2. Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 3. Install readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
