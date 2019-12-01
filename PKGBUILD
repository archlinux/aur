# Maintainer: mehalter <micah at mehalter.com>
# Contributor: Ivy Foster <code@escondida.tk>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=translate-shell-git
pkgver=0.9.6.11.0115103
pkgrel=1
pkgdesc='A command-line interface and interactive shell for Google Translate.'
arch=(i686 x86_64)
url='https://www.soimort.org/translate-shell/'
license=('custom:PublicDomain')
depends=(gawk bash)
makedepends=(git)
optdepends=(
	'fribidi: display right-to-left languages'
	'mplayer: Text-to-Speech functionality'
	'mplayer2: Text-to-Speech functionality'
	'mpv: Text-to-Speech functionality'
	'mpg123: Text-to-Speech functionality'
	'espeak: Text-to-Speech functionality'
	'rlwrap: readline-style editing and history in the interactive mode'
	'emacs: Emacs interface'
)
conflicts=(translate-shell)
provides=(translate-shell)
source=('git+https://github.com/soimort/translate-shell.git')
md5sums=(SKIP)

pkgver() {
	cd translate-shell
	git describe | sed 's,^v,,; s@-\([0-9]\+\)-@.r\1.@'
}

build() {
	cd translate-shell
	make
}

package() {
	cd translate-shell
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/translate-shell-git/LICENSE"
}
