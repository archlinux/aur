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
sha256sums=('b64e0d9284208c40f8d9130ae01e36b6d071fedfcc851e317c911aa1f858b0ef')

build() {
  # No build steps needed
  return 0
}

package() {
  # Detect whether yay extracted inside a subfolder or not
  if [ -d "$srcdir/clivm-1.0.0" ]; then
    echo "Entering subdir clivm-1.0.0"
    cd "$srcdir/clivm-1.0.0"
  else
    echo "Entering srcdir directly"
    cd "$srcdir"
  fi

  # Create necessary directories in package
  install -dm755 "$pkgdir/usr/share/clivm/binaries"
  install -dm755 "$pkgdir/usr/share/clivm/installers"

  # Copy binaries and installers
  cp -r binaries/* "$pkgdir/usr/share/clivm/binaries/"
  cp -r installers/* "$pkgdir/usr/share/clivm/installers/"

  # Install the executable launcher
  install -Dm755 clivm.py "$pkgdir/usr/bin/clivm"
}
