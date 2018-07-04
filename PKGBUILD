# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=vim-gdscript-git
gitname=vim-gdscript3
pkgver=r70.e9e0cce
pkgrel=1
pkgdesc="Vim syntax highliting for the Godot Game Engine scripting language GDScript"
arch=('any')
url="https://github.com/calviken/$gitname"
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$gitname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	local vim_file="gdscript3.vim"
	local vim_share="/usr/share/vim/vimfiles"

	cd "$srcdir/$gitname"

	install -Dm644 "ftdetect/gdscript3.vim" "$pkgdir/$vim_share/ftdetect/gdscript3.vim"
	install -Dm644 "ftplugin/gdscript3.vim" "$pkgdir/$vim_share/plugin/gdscript3.vim"
	install -Dm644 "indent/gdscript3.vim" "$pkgdir/$vim_share/indent/gdscript3.vim"
	install -Dm644 "syntax/gdscript3.vim" "$pkgdir/$vim_share/syntax/gdscript3.vim"
	install -Dm644 "syntax/gdscript3.vim" "$pkgdir/$vim_share/syntax/gdscript3.vim"

	# Recreate all the directories under the python subdirectory in our filesystem:
	find python -type d -exec install -dm755 "$pkgdir/$vim_share/"{} \;

	# Now copy all the files with the right permissions:
	find python -type f -exec install -Dm644 {} "$pkgdir/$vim_share/"{} \;
}

