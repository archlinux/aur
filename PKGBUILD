# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100:

pkgname=vim-perl-support
pkgver=5.3.2
_src_id=22459
pkgrel=2
pkgdesc='Perl-IDE offers easiest way to do all of the above, saving lot of time and keystrokes.'
arch=('any')
url='http://vim.org/scripts/script.php?script_id=556'
license=('GPL2')
groups=(vim-plugins)
depends=(vim-runtime perl vim-vim-support)
optdepends=(
  'perl-perl-tags: to generate Ctags style tags for Perl sourcecode'
  'perl-devel-smallprof: to run per-line Perl profiler'
  'perl-critic: Critique Perl source code for best-practices'
  'perl-devel-fastprof: to run "fast" perl per-line profiler'
  'perl-devel-nytprof: Powerful fast feature-rich perl source code profiler'
  'perl-tidy: Parses and beautifies perl source'
)
options=(!emptydirs)
install='vimdoc.install'
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")

package() {
	cd "$srcdir"
	_vim_dir='/usr/share/vim/vimfiles'

  install -dm755 $pkgdir/$_vim_dir

  tar -c ./  --exclude $pkgname-$pkgver.zip \
    | tar -x -C $pkgdir/$_vim_dir

	#mv $pkgdir/${_vim_dir}/README.perlsupport \
	#	$pkgdir/${_vim_dir}/perl-support/doc/README.perlsupport

  #conflict with vim-vim-support
  #rm -f $pkgdir/${_vim_dir}/{autoload/mmtemplates/core.vim,doc/templatesupport.txt}
  rm -f "$pkgdir"/usr/share/vim/vimfiles/syntax/template.vim \
    "$pkgdir"/usr/share/vim/vimfiles/autoload/mmtemplates/core.vim \
    "$pkgdir"/usr/share/vim/vimfiles/doc/templatesupport.txt


  #fix perm
#  find $pkgdir/$_vim_dir -type d -exec chmod 0755 '{}' ';'
#  chmod o+r $pkgdir/${_vim_dir}/perl-support/doc/*
}
sha256sums=('78544a59adb00af2e29d3b69816255b8671d57bbb9cba23b1236b4e2d6294be7')
