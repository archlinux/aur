# Maintainer: Your Name <hvhboynixware@gmail.com>
pkgname=py-cpu-z-git
pkgver=r5.5dfa10c
pkgrel=1
pkgdesc="A sleek, terminal-based CPU-Z clone and hardware monitor."
arch=('any')
url="https://github.com/hvhboynixware-ui/cpu-zLINUX.py"
license=('MIT')
depends=('python' 'python-psutil' 'python-rich')
makedepends=('git')
provides=('pycpuz')
conflicts=('pycpuz')

# FIX 1: We force makepkg to name the downloaded folder exactly "$pkgname"
source=("$pkgname::git+https://github.com/hvhboynixware-ui/cpu-zLINUX.py.git")
sha256sums=('SKIP')

pkgver() {
  # FIX 2: We enter that guaranteed folder name
  cd "$srcdir/$pkgname"
  
  # FIX 3: Since you don't have GitHub releases/tags yet, we use a simpler version generator 
  # that just counts your total commits (e.g., it will output something like "r15.a1b2c3d")
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  # Notice the hyphens in the filename here!
  install -Dm755 py-cpu-z.py "$pkgdir/usr/bin/pycpuz"
}
