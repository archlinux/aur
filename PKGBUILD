# Maintainer: AruAVI <arubaanimates@gmail.com>

pkgname=clivm
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI-based Linux virtualization management tool"
arch=('any')
url="https://github.com/AruAVI/clivm"
license=('MIT')
depends=('debootstrap' 'arch-install-scripts' 'wget' 'git')
makedepends=()
source=("clivm-${pkgver}.tar.gz")
sha256sums=('bfe2e60f517b75d5006ceabde7fa24e4c72460a132d99674da836bef48794b61')

build() {
  # Create the subdirectory and move all extracted files there
  mkdir -p "$srcdir/clivm-1.0.0"
  mv "$srcdir"/* "$srcdir/clivm-1.0.0"/ 2>/dev/null || true
}

package() {
  cd "$srcdir/clivm-1.0.0"

  # Create directories in package
  install -dm755 "$pkgdir/usr/share/clivm/binaries"
  install -dm755 "$pkgdir/usr/share/clivm/installers"

  # Copy files into package
  cp -r binaries/* "$pkgdir/usr/share/clivm/binaries/"
  cp -r installers/* "$pkgdir/usr/share/clivm/installers/"

  # Install executable launcher
  install -Dm755 clivm.py "$pkgdir/usr/bin/clivm"
}
