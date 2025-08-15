pkgname=addrforge-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="AddrForge is a fast, multi-threaded CLI tool that generates cryptocurrency addresses with custom prefixes."
arch=('x86_64' 'aarch64')
url="https://github.com/say8hi/addrforge-cli"
license=('MIT')
depends=()
provides=('addrforge')
conflicts=('addrforge')

source_x86_64=("$url/releases/download/v$pkgver/addrforge-linux-amd64.tar.gz")
# https://github.com/say8hi/addrforge-cli/releases/download/v1.0.0/addrforge-linux-amd64.tar.gz
source_aarch64=("$url/releases/download/v$pkgver/addrforge-linux-arm64.tar.gz")

sha256sums_x86_64=('cdc6f21770c0c8c053fe34403d07c467c22a09a63af31bb3f9979ce26fed44eb')
sha256sums_aarch64=('c2b8daea17b50c81ed88b4380163df5ab58b9567ae1b6cf0f052daeba68bdba0')

package() {
  cd "$srcdir"

    if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf "addrforge-linux-amd64.tar.gz"
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf "addrforge-linux-arm64.tar.gz"
  fi

  install -Dm755 addrforge "$pkgdir/usr/bin/addrforge"
  install -Dm644 .github/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 .github/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

