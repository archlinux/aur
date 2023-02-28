# Maintainer: Franklin Yu <franklinyu@google.com>
pkgname=iterm2-shell-integration
pkgver=3.4.19
pkgrel=1
pkgdesc='Shell integration of iTerm2, useful when SSH from macOS.'
arch=('any')
conflict=('imgcat')
url="https://iterm2.com"
license=('GPL')

_commit=e4115113df7704497e3d1d01dd02c11710931063  # git rev-parse "v$pkgver"
source=(git+https://github.com/gnachman/iTerm2.git#commit=$_commit)
sha256sums=('SKIP')

prepare() {
	cd 'iTerm2'
	git submodule update --init submodules/iTerm2-shell-integration
}

package() {
	cd 'iTerm2/submodules/iTerm2-shell-integration'
	install -D --mode=644 shell_integration/zsh \
		"$pkgdir/usr/share/zsh/plugins/iterm2_shell_integration.zsh"
	mkdir --parents "$pkgdir/usr/bin"
	for exe in imgcat it2git it2ssh
	do install --mode=755 "utilities/$exe" "$pkgdir/usr/bin/$exe"
	done
}
