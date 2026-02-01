# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=sit-git
_pkgname=sit
pkgver=r28.8e3d641
pkgrel=1
pkgdesc="A tool to create StuffIt 1.5.1 archives, compatible with Classic Mac OS"
arch=('x86_64')
url="https://github.com/thecloudexpanse/sit"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # This repo currently has no tags, so we use the count.hash format.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"

  # 1. Install the binary
  install -Dm755 sit "$pkgdir/usr/bin/sit"

  # 2. Install the License (Mandatory for Arch packages)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 3. Install Readme as documentation (Optional but recommended)
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
