# Maintainer: Sandroid <sandroid at posteo dot net>
# Maintainer: Wenxuan Zhang <wenxuangm at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=forgit
pkgver=23.07.0
pkgrel=2
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
sha256sums=('1f20d62118f62a8fb2b2c01fb15b6c114eca6abdff68e3288d5428e2bf0c9b96')

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
	install -Dvm644 completions/git-forgit.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/completions/"

	# fish install
	install -Dvm644 conf.d/forgit.plugin.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -dv "$pkgdir/usr/share/fish/vendor_conf.d/bin/"
	ln -sv /usr/bin/git-forgit "$pkgdir/usr/share/fish/vendor_conf.d/bin/"

	# docs
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	# license
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

