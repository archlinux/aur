# Maintainer: archlinux.info:tdy

pkgname=barefoot-git
pkgver=r17.6960d86
pkgrel=1
pkgdesc="Convert Fountain screenplay files to plain text, ready for printing, from the shell"
arch=(i686 x86_64)
url=https://gitlab.com/notklaatu/barefoot
license=(GPL3)
depends=(boost-libs)
makedepends=(git boost)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://gitlab.com/notklaatu/${pkgname%-git})
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  g++ -I /usr/include/boost/ ${pkgname%-git}.cpp \
    -o ${pkgname%-git} -L /usr/lib/ -lboost_regex
}

package() {
  cd $pkgname
  install -Dm755 ${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
  install -m644 formatting.notes "$pkgdir"/usr/share/doc/$pkgname/
}
