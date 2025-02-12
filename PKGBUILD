pkgname=lush-shell
pkgver=0.3.1
pkgrel=2
pkgdesc="Lunar shell is a Linux shell powered by Lua."
arch=('x86_64')
url="https://github.com/BanceDev/lush"
license=('BSD-3-Clause')
depends=('lua')
makedepends=('make' 'gcc' 'premake')
source=("https://github.com/BanceDev/lush/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af1b5b1768ba561d93fc6ef1492df07b544c5c4fbaad28d0514d3274475fca26')

build() {
  cd "$srcdir/lush-$pkgver"
  premake5 gmake
  make
}

package() {
  cd "$srcdir/lush-$pkgver"

  # install binary
  install -Dm755 bin/Debug/lush/lush "$pkgdir/usr/bin/lush"

  # Notify the user about `/etc/shells`
  echo "To use lush as a shell, add it to /etc/shells manually:"
  echo "    echo \"/usr/bin/lush\" | sudo tee -a /etc/shells"
  echo "To make lush your default shell run: chsh -s /usr/bin/lush"
  echo "Logout and back in for changes to take effect"
  echo "Example config files can be found at https://github.com/BanceDev/lush"
}
