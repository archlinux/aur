# Maintainer: Ishaan Bhimwal <ishaanbhimwal@gmail.com>

pkgname=manjaro-zsh-config
pkgver=0.22
pkgrel=1
pkgdesc="Zsh configuration used in Manjaro"
arch=(any)
url="https://github.com/Chrysostomus/manjaro-zsh-config"
_gitcommit=737fba1290f15e8092b2c92dc78698d82a35c398
license=('MIT')
conflicts=('grml-zsh-config')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'ttf-nerd-fonts-symbols'
	'zsh-theme-powerlevel10k')
backup=(usr/share/zsh/.zshrc)
install="$pkgname.install"
source=("$pkgname-$_gitcommit.tar.gz::$url/archive/$_gitcommit.tar.gz"
		"fix_install.patch")
sha256sums=('5e9ecd772cb73d34c2eb798db7007f1f63bdfb7c7c9a99022b735b46ac1adbcc'
            'f886a9591e42cebdfc171aa2120cf1a2db9598c3be33631282b5c3fe3bd7a47f')

prepare() {
	cd "$pkgname-$_gitcommit"
	patch --strip=1 --input="${srcdir}/fix_install.patch"
}

package() {
	cd "$pkgname-$_gitcommit"
	install -D -m644 .zshrc -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 "$pkgname" -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 manjaro-zsh-prompt -t "${pkgdir}/usr/share/zsh"
	install -D -m644 zsh-maia-prompt -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 p10k.zsh -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 p10k-portable.zsh -t "${pkgdir}/usr/share/zsh/"
	install -D -m644 command-not-found.zsh -t "${pkgdir}/usr/share/zsh/functions/"
	install -d "$pkgdir/usr/share/zsh/scripts"
	cp -r base16-shell "$pkgdir/usr/share/zsh/scripts/"
	chmod a+x "$pkgdir/usr/share/zsh/scripts/base16-shell/"*
}
