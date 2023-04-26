# Tpaefawzen <GitHub: Tpaefaezen>
pkgname=misc-tools-git
pkgver=r281.3548ffb
pkgrel=1
pkgdesc="ShellShoccar-jpn's miscellaneous tools"
arch=(any)
url="https://github.com/ShellShoccar-jpn/misc-tools"
license=(custom:CC0)
groups=(shellshocar-jpn)
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/ShellShoccar-jpn/misc-tools")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

# build C programs
	cd C_SRC
	./MAKE.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"

# obtained things
# excluding items found on other official packages such as coreutils and util-linux
	_bins=(# base64
		enumdate
		exflock
		fsed
		greo
		gres
		gzpipe
		hira2kata
		is_furigana
		kata2hira
		mime-make
		mkcgipost
		mkcookie
		mkstemp
		# mktemp
		name-cgi
		pcllock
		pexlock
		pshlock
		punlock
		# rev
		sendjpmail
		sendu8mail
		# seq
		sessionf
		sigamp
		tarize
		# truncate
		unescoct
		urldecode
		urlencode
		utconv
		utf8wc
		zpipe
		C_SRC/getfilets
		C_SRC/getftimes
		C_SRC/herewego
		C_SRC/linets
		C_SRC/ptw
		# C_SRC/sleep
		C_SRC/tscat
		C_SRC/typeliner
		C_SRC/valve)


# finally
	install -d "$pkgdir/usr/bin/"
	install -Dm755 "${_bins[@]}" "$pkgdir/usr/bin/"
				
}
