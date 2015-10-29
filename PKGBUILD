# Maintainer: Peter Vágner <pvdeejay@gmail.com>

pkgname=emacs-speechd-el-git
pkgver=20141025.3d72981
pkgrel=2
pkgdesc="Emacs speech and Braille output interface"
url="http://devel.freebsoft.org/speechd-el"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('git' 'make' 'texinfo')
optdepends=('speech-dispatcher: for speech output'
  'brltty: for braille support'
  'perl: for speechd-log-extractor script')
conflicts=('emacs-speechd-el')
provides=('emacs-speechd-el=$pkgver')
install=emacs-speechd-el-git.install
source=(git://git.freebsoft.org/git/speechd-el)
md5sums=('SKIP')
_gitname=speechd-el

pkgver() {
  cd $srcdir/$_gitname
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd $srcdir/$_gitname
  make
}

package() {
  cd $srcdir/$_gitname
  el_dir=/usr/share/emacs/site-lisp/speechd-el
  info_dir=/usr/share/info
  bin_dir=/usr/bin
  install -m 755 -d $pkgdir{$el,$info,$bin}_dir
  install -m 644 -t $pkgdir$el_dir *.el{,c}
  install -m 644 -t $pkgdir$info_dir *.info
  install -m 755 -t $pkgdir$bin_dir speechd-log-extractor
}
