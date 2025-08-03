# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=kak-fzf-git
pkgver=r357.092bcb8
pkgrel=1
pkgdesc='FZF for kakoune'
arch=(any)
url="https://github.com/andreyorst/fzf.kak"
license=(MIT)
depends=(kakoune fzf)
makedepends=(git)
optdepends=('the_silver_searcher: file command'
            'fd: file command'
            'ripgrep: file/grep commands'
            'bat: highlight command'
            'ruby-coderay: highlight command'
            'highlight: highlight command'
            'ruby-rouge: highlight command'
            'ctags: fzf-ctags module'
            'bzr: fzf-bzr module'
            'git: fzf-git module'
            'mercurial: fzf-hg module'
            'subversion: fzf-svn module')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/fzf.kak"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/fzf.kak"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/fzf.kak
	for module in fzf-{buffer,cd,ctags,file,grep,project,search,vcs} VCS/fzf-{bzr,git,hg,svn}; do
		install -Dm644 -t "$pkgdir/usr/share/kak/rc/addons" rc/modules/$module.kak
	done
}
