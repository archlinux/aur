# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vim-coquille-git
pkgver=3bd17ca
pkgrel=1
pkgdesc="Vim plugin aiming to bring the interactivity of CoqIDE into your favorite editor."
arch=('i686' 'x86_64')
url="https://github.com/the-lambda-church/coquille"
license=('ISC')
depends=('vim-runtime')
source=("$pkgname"::'git+https://github.com/the-lambda-church/coquille.git#branch=pathogen-bundle'
	'vimbufsync'::'git+https://github.com/let-def/vimbufsync.git#branch=master')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -n1 --pretty=format:%h
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
  sed -i s/^/\"/g "$pkgdir/usr/share/vim/vimfiles/ftdetect/coq.vim"
  cd "$srcdir/vimbufsync"
  find * -maxdepth 0 -type d -exec cp -R -t "$pkgdir/usr/share/vim/vimfiles" '{}' \+
}
