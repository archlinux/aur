# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gnu-global
pkgver=6.6.4
pkgrel=1
pkgdesc='Source code tagging system'
url='https://www.gnu.org/software/global/'
arch=('x86_64')
license=('GPL3')
source=("https://ftp.gnu.org/pub/gnu/global/global-$pkgver.tar.gz")
sha256sums=('987e8cb956c53f8ebe4453b778a8fde2037b982613aba7f3e8e74bcd05312594')
makedepends=(gperf)

build() {
  cd global-$pkgver
  sh reconf.sh
  ./configure --prefix=/usr
}

build() {
  cd global-$pkgver
  make
}

package() {
  cd global-$pkgver
  DESTDIR="$pkgdir" make install

  # auto-enable vim plugin
  install -d "$pkgdir"/usr/share/vim/vimfiles/autoload/
  ln -s /usr/share/gtags/gtags.vim "$pkgdir"/usr/share/vim/vimfiles/autoload/
}
