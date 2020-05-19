# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=vim-gdscript
gitname=vim-gdscript3
pkgver=0.2
pkgrel=2
pkgdesc="Vim syntax highliting for the Godot Game Engine scripting language GDScript"
arch=('any')
url="https://github.com/calviken/$gitname"
source=("$url/archive/v$pkgver.tar.gz")
provides=('vim-gdscript')
conflicts=('vim-gdscript-git')
sha256sums=('e9b2576558a4bba7d942e033249ddf9f96c65566e9671c346b4851ef501b0a0e')

package() {
	local vim_file="gdscript3.vim"
	local vim_share="/usr/share/vim/vimfiles"

	cd "$srcdir/$gitname-$pkgver"

	install -Dm644 "ftdetect/gdscript3.vim" "$pkgdir/$vim_share/ftdetect/gdscript3.vim"
	install -Dm644 "ftplugin/gdscript3.vim" "$pkgdir/$vim_share/plugin/gdscript3.vim"
	install -Dm644 "indent/gdscript3.vim" "$pkgdir/$vim_share/indent/gdscript3.vim"
	install -Dm644 "syntax/gdscript3.vim" "$pkgdir/$vim_share/syntax/gdscript3.vim"

	# Recreate all the directories under the python subdirectory in our filesystem:
	find python -type d -exec install -dm755 "$pkgdir/$vim_share/"{} \;

	# Now copy all the files with the right permissions:
	find python -type f -exec install -Dm644 {} "$pkgdir/$vim_share/"{} \;
}

