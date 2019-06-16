# Maintainer: 3ED <krzysztofas /at/ protonmail /\./ com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=vim-perl-support
pkgver=5.4
_src_id=24473
pkgrel=2
pkgdesc='Perl-IDE offers easiest way to do all of the above, saving lot of time and keystrokes.'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=556'
license=('GPL2')
groups=(vim-plugins)
depends=('perl' 'vim-vim-support>=2.4')
optdepends=(
	'perl-perl-tags: to generate Ctags style tags for Perl sourcecode'
	'perl-devel-smallprof: to run per-line Perl profiler'
	'perl-critic: Critique Perl source code for best-practices'
	'perl-devel-fastprof: to run "fast" perl per-line profiler'
	'perl-devel-nytprof: Powerful fast feature-rich perl source code profiler'
	'perl-tidy: Parses and beautifies perl source'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_src_id")
sha256sums=('40cadfcb64433557ad793ec71f0947fae6ec38b9d4b4af2e6ed0ee7b77156125')
noextract=("$pkgname-$pkgver.zip")

package() {
	cd "$srcdir"
	_vim_dir='/usr/share/vim/vimfiles'

	install -dm755 "$pkgdir/$_vim_dir"

	bsdtar -xf $pkgname-$pkgver.zip \
		--exclude autoload/mmtemplates/config.vim \
		--exclude autoload/mmtemplates/core.vim \
		--exclude autoload/mmtemplates/wizard.vim \
		--exclude doc/templatesupport.txt \
		--exclude ftdetect/template.vim \
		--exclude ftplugin/template.vim \
		--exclude syntax/template.vim \
		--directory "$pkgdir/$_vim_dir"

	# note: exclusions should be inside vim-vim-support package

	chmod -R a=,a+rX,u+w "$pkgdir/"
}
