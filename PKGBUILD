# Maintainer: hamki <hamki.do2000@gmail.com>
# Contribtor: Étienne Deparis <etienne@depar.is>
# Contribtor: xgdgsc <xgdgsc@gmail.com>

pkgname=emacs-multiple-cursors
_pkgname=multiple-cursors
pkgver=1.4.0
pkgrel=1
pkgdesc="Multiple cursors for Emacs"
arch=("any")
url="https://github.com/magnars/multiple-cursors.el"
license=("GPL3")
install=$pkgname.install
depends=("emacs")
source=("https://github.com/magnars/$_pkgname.el/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('33a1c193cf8bcb0c80f71a154cbbc1956ee80a79ec63ebcaf3ea6fb6298c3042')

build() {
  cd $srcdir/$_pkgname.el-$pkgver/
  for file in $(find . -maxdepth 1 -type f -name '*.el'); do
    emacs -Q --batch --eval "(progn (load-file \"multiple-cursors-core.el\")(load-file \"mc-mark-more.el\")(byte-compile-file \"${file}\"))"
  done
}



package() {
  cd $srcdir/$_pkgname.el-$pkgver/
  install -d -m755       $pkgdir/usr/share/emacs/site-lisp/multiple-cursors
  install    -m644 *.elc $pkgdir/usr/share/emacs/site-lisp/multiple-cursors/
}
