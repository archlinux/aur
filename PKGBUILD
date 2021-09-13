# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus-bin
pkgver=1.5.3
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
provides=("gitstatus")
conflicts=("gitstatus")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('7cadc28f3a458bf28c721d2b9e669d0b487b6c8e2af255efd2e7385a1edf78eed1109311753b941b4d00ac632e4bd76b4352061b76ef03fea7a34a3f5a0cd99a')
depends=('glibc')
makedepends=('zsh')
install='gitstatus.install'

build() {
  cd "$srcdir/gitstatus-${pkgver}"
  make pkg
}

package() {
  cd "$srcdir/gitstatus-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/gitstatus/{}" ';'
  make -C "$pkgdir"/usr/share/gitstatus zwc minify
}
