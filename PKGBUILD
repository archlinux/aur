# Maintainer: Da4ndo <contact@da4ndo.com>
pkgname=hyde-ext
pkgver=1.0.7+beta
pkgrel=1
pkgdesc="Hyde-Ext is a Rust-based command-line application designed to enhance the HyDE (HyDE_CLI) environment. It automates tasks, installs essential tools, manages configurations, and restores settings from backups."
arch=('x86_64')
url="https://github.com/da4ndo/hyde-ext"
license=('MIT')
source=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/Da4ndo/hyde-ext/releases/download/v$pkgver/$pkgname-$pkgver-x86_64.tar.gz")
sha256sums=('SKIP')

pkgver() {
  echo ":: Generating package version..."
  local version=$(curl -s "https://api.github.com/repos/Da4ndo/hyde-ext/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  if [[ -z "$version" ]]; then
    echo -e "\033[31mError:\033[0m Failed to fetch the latest version tag from GitHub."
    exit 1
  else
    echo "  -> Latest version fetched: $version"
    pkgver=${version#v}
    echo "  -> Package version set to: $pkgver"
  fi
}

package() {
  cd "$srcdir"
  install -Dm755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
  cp -r "./assets" "$pkgdir/usr/share/$pkgname/assets"
}
