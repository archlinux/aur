# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_basename=coccinelle
pkgname=$_basename-bin
_distver=1.3
pkgver=$_distver.0
pkgrel=1
pkgdesc="C source code matching and transformation engine. Without spgen and Python bindings."
arch=('x86_64')
url="https://coccinelle.lip6.fr"
license=('GPL-2.0-or-later')
depends=('glibc')
conflicts=('coccinelle' 'coccinelle-git')
provides=('coccinelle')
source=("https://coccinelle.gitlabpages.inria.fr/website/distrib/coccinelle-${_distver}-bin-x86.tar.gz")
b2sums=('c29c1775837b7bd19ad70540e50099cbfee8f15222dc4117b5fd6177ffb2c0352154966e1d155e3ca74ed2f5747530270c646d8397cd4a858e5a1ebafcc3c917')

package() {
        cd $srcdir/$_basename-$_distver

	# spatch
	strip spatch.opt
	install -Dm755 spatch.opt $pkgdir/usr/bin/spatch

	# Bash completions
	install -Dm644 scripts/spatch.bash_completion $pkgdir/usr/share/bash-completion/completions/spatch

	# Emacs modes
	install -Dm644 editors/emacs/cocci.el -t $pkgdir/usr/share/emacs/site-lisp
	install -Dm644 editors/emacs/cocci-ediff.el -t $pkgdir/usr/share/emacs/site-lisp

	# vim
	install -Dm644 editors/vim/ftdetect/cocci.vim -t $pkgdir/usr/share/vim/vimfiles/ftdetect
	install -Dm644 editors/vim/syntax/cocci.vim -t $pkgdir/usr/share/vim/vimfiles/syntax

	# Manpage
	install -Dm644 docs/spatch.1 -t $pkgdir/usr/share/man/man1

	# OCaml libraries
	find ocaml -name \*cmi -or -name \*cmx -exec install -Dm644 {} -t $pkgdir/usr/lib/ocaml/coccinelle \;
	install -Dm644 standard.h -t $pkgdir/usr/lib/ocaml/coccinelle
	install -Dm644 standard.iso -t $pkgdir/usr/lib/ocaml/coccinelle
}
