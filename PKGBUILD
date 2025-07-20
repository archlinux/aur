pkgname=updaterv2
pkgver=5.32
pkgrel=5
pkgdesc="This is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash' 'jq')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  echo "Listing files in $srcdir/testpackage-main before chmod:"
  ls -l "$srcdir/testpackage-main"

  # If config.sh missing, copy fallback from current directory
  if [[ ! -f "$srcdir/testpackage-main/config.sh" ]]; then
    echo "config.sh missing in source dir, copying fallback..."
    cp ./config.sh "$srcdir/testpackage-main/config.sh"
  fi

  # Same for code.sh just in case (optional)
  if [[ ! -f "$srcdir/testpackage-main/code.sh" ]]; then
    echo "code.sh missing in source dir, copying fallback..."
    cp ./code.sh "$srcdir/testpackage-main/code.sh"
  fi

  chmod +x "$srcdir/testpackage-main/code.sh"
  chmod +x "$srcdir/testpackage-main/config.sh"

  echo "To run the updater type 'updater'"
  sleep 3
}

package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/updater"
  install -Dm755 "$srcdir/testpackage-main/config.sh" "$pkgdir/usr/bin/updater-config"
}
