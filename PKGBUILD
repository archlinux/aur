# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

pkgname=gitstatus-git
pkgver=r1371.0440e38
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake' 'wget' 'zsh')
install=gitstatus.install
provides=("gitstatus")
conflicts=("gitstatus")
source=('gitstatus::git+https://github.com/romkatv/gitstatus.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gitstatus"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/gitstatus"
  ./build -w
}

package() {
  cd "$srcdir"
  find gitstatus -type f -exec install -D '{}' "$pkgdir/usr/share/{}" ';'
  make -C "$pkgdir"/usr/share/gitstatus zwc minify
}
