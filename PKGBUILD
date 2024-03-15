# Maintainer: Sandroid <sandroid at posteo dot net>
# Maintainer: Wenxuan Zhang <wenxuangm at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=forgit
pkgver=24.03.2
pkgrel=1
pkgdesc="Utility tool powered by fzf for using git interactively"
arch=('any')
url="https://github.com/wfxr/forgit"
license=('MIT')
groups=('fish-plugins' 'zsh-plugins')
depends=('bash' 'fzf' 'git')
optdepends=(
	'zsh: supported shell'
	'fish: supported shell'
	'git-delta: human readable diffs'
	'diff-so-fancy: human readable diffs'
	'bat: syntax highlighting for .gitignore'
	'emoji-cli: emoji support for git log')
provides=("$pkgname")
conflicts=("forgit-git")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6aee3d897fa163ba3985e6b46b4458aadfff9d1c44ba951b4185414e7f032cfb')

package() {
	cd "$pkgname-$pkgver"

	# wrapper script
	install -Dv bin/git-forgit -t "$pkgdir/usr/bin/"

	# bash completions
	install -Dvm644 completions/git-forgit.bash -t ~/.local/share/bash-completion/completions/

	# zsh install
	install -Dvm644 forgit.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -dv "$pkgdir/usr/share/zsh/plugins/$pkgname/bin/"
	ln -sv /usr/bin/git-forgit "$pkgdir/usr/share/zsh/plugins/$pkgname/bin/"

	# zsh completions
	install -Dvm644 completions/_git-forgit -t "$pkgdir/usr/share/zsh/site-functions/"

	# fish install
	install -Dvm644 conf.d/forgit.plugin.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -dv "$pkgdir/usr/share/fish/vendor_conf.d/bin/"
	ln -sv /usr/bin/git-forgit "$pkgdir/usr/share/fish/vendor_conf.d/bin/"

	# docs
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	# license
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

