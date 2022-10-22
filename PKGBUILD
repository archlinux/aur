# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Arvid Norlander <anmaster A_T tele2 d_o_t (ccTLD for Sweden, which is se)>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=tup-git
pkgver=0.7.11.r111.gf26bc1e8
pkgrel=1
pkgdesc='A fast, file-based build system'
arch=(i686 x86_64)
url='https://gittup.org/tup/index.html'
license=(GPL2)
depends=(fuse3 pcre)
makedepends=(git)
provides=(tup)
conflicts=(tup)
install=tup.install
source=(git+https://github.com/gittup/tup)
sha512sums=('SKIP')

pkgver() {
  cd tup
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd tup
  sh bootstrap.sh
}

#check() {
#  cd tup/test
#  ./test.sh
#}

package() {
  cd tup

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/share/vim/vimfiles/{syntax,ftdetect}
  install -m755 -t "$pkgdir"/usr/bin tup
  install -m644 -t "$pkgdir"/usr/share/man/man1 tup.1
  install -m644 -t "$pkgdir"/usr/share/vim/vimfiles/syntax contrib/syntax/tup.vim
  echo 'au BufNewFile,BufRead Tupfile,*.tup setf tup' > "$pkgdir"/usr/share/vim/vimfiles/ftdetect/tup.vim
}
