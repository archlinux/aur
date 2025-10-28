# Maintainer: szoltysek <karolszoltysek.ti@gmail.com>

pkgname=fossglaze-git
pkgver=1.0.r4.g97aef0f
pkgrel=1
pkgdesc="Rub your Linux distro into every Discord user's face via Discord RPC"
arch=('any')
url="https://github.com/szoltysek/fossglaze"
license=('GPL3')
depends=('python' 'python-pypresence')
makedepends=('git')
provides=('fossglaze')
conflicts=('fossglaze')
source=("git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fossglaze"
  # Generate version string like: 1.0.rXX.gabcdef
  printf "1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fossglaze"

  # Install the Python script as an executable
  install -Dm755 fossglaze.py "$pkgdir/usr/bin/fossglaze"

  # Install documentation and license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
