# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=forgit-git
_pkgname=${pkgname%-git}
pkgver=22.11.0.r1.gfe4ac0f
pkgrel=1
pkgdesc="Utility tool powered by fzf for using git interactively"
arch=('any')
url="https://github.com/wfxr/forgit"
license=('MIT')
groups=('fish-plugins' 'zsh-plugins')
depends=('bash' 'fzf')
optdepends=(
	'zsh: supported shell'
	'fish: supported shell'
	'git-delta: human readable diffs'
	'diff-so-fancy: human readable diffs'
	'bat: syntax highlighting for .gitignore'
	'emoji-cli: emoji support for git log')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$_pkgname"

	# wrapper script
	install -Dv bin/git-forgit -t "$pkgdir/usr/bin/"

	# zsh install
	install -Dvm644 forgit.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"

	# fish install
	install -Dvm644 conf.d/forgit.plugin.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"

	# docs
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	# license
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
