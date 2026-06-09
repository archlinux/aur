# Maintainer: 7erez <the7erez@gmail.com>
pkgname=7sh
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimal POSIX-compliant custom shell with native UTF-8 support by 7erez (Stable Release)"
arch=('x86_64' 'aarch64')
url="https://github.com/the7erez/7sh"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('7sh')
conflicts=('7sh-git')

source=("https://github.com/the7erez/7sh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make clean && make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  # تثبيت الـ Binary الأساسي
  install -Dm755 bin/7sh "$pkgdir/usr/bin/7sh"

  # دعم الـ Syntax لـ Vim
  install -Dm644 /dev/stdin "$pkgdir/usr/share/vim/vimfiles/ftdetect/7sh.vim" <<EOF
au BufNewFile,BufRead *.7shrc,7shrc set filetype=bash
EOF
}
