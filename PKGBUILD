
pkgname=webers-git
pkgver=1.0.0
pkgrel=2
pkgdesc="A python program that allows components in plain html"
arch=(x86_64)
url="https://github.com/spynetS/webers"
license=('GPL3')
depends=(python python-flagser python-beautifulsoup4 git)
source=("webers::git+https://github.com/spynetS/webers.git")
sha256sums=('SKIP') # Skip checksum verification for Git sources

#i tried
# pkgver() {
#   cd "${srcdir}/${pkgname%-git}"
#   ( set -o pipefail
#     git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
#   )
# }

prepare() {
  cd webers/docs
  exec ./makeman.sh #create manpage from md
}

package() {
  cd webers
  install -Dm755 ./src/main.py "$pkgdir/usr/bin/webers" 
  install -Dm755 ./src/PyTml.py "$pkgdir/usr/bin/PyTml.py" 
  install -Dm755 ./src/watcher.py "$pkgdir/usr/bin/watcher.py" 
  install -Dm644 ./docs/webers.1 "$pkgdir/usr/share/man/man1/webers.1"
}
