# Maintainer: 7erez <your-email@example.com>
pkgname=7sh
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimal POSIX-compliant custom shell with native UTF-8 support by 7erez (Stable Release)"
arch=('x86_64' 'aarch64')
url="https://github.com/the7erez/7sh"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('7sh')
conflicts=('7sh-git') # عشان السيستم يعرف إنهم ميبقوش راكبين فوق بعض
source=("https://github.com/the7erez/7sh/archive/refs/tags/v${pkgver}.tar.gz")
# هنحسب الـ sha256sum الحقيقي في الخطوة الجاية
sha256sums=('927f3973da78e6d3175a1c88e0ca7674e259190fc377835b38442ee7a6c0e2b4')

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
