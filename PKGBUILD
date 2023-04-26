# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>
pkgname=shellshoccar-jpn-tukubai-git
pkgver=r402.403f5f1
pkgrel=1
pkgdesc="ShellShoccar-Jpn's fork of Open usp Tukubai implemented in shellscript"
arch=(any)
url="https://github.com/ShellShoccar-jpn/Open-usp-Tukubai"
license=(custom:CC0)
groups=(shellshoccar-jpn)
depends=()
makedepends=(git)
provides=("${pkgname%-git}" open-usp-tukubai)
conflicts=("${pkgname%-git}" open-usp-tukubai
	'gsm' # tscat
	)
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/ShellShoccar-jpn/Open-usp-Tukubai.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# necessary directories
	_dirs=(/usr/bin/
		/usr/share/doc/open-usp-tukubai/
		/usr/share/licenses/open-usp-tukubai/)
	for i in ${!_dirs[*]}; do 
		_dirs[i]=$pkgdir/${_dirs[i]}
	done
	install -d "${_dirs[@]}"

	# commands to install
	_bins=(calclock
		cgi-name
		cjoin0
		cjoin1
		cjoin2
		comma
		count
		ctail
		delf
		filehame
		formhame
		getfirst
		getlast
		gyo
		han
		keta
		keycut
		mime-read
		mojihame
		mojihame-h
		mojihame-l
		mojihame-p
		nameread
		plus
		retu
		self
		sm2
		sm4
		sm5
		sorter
		tarr
		tateyoko
		tcat
		up3
		yarr
		ycat
		ysum
		zen)
	for i in ${!_bins[@]}; do
		_bins[i]=COMMANDS.SH/${_bins[i]}
	done
	install -Dm755 "${_bins[@]}" "$pkgdir/usr/bin/"

	# documents please
	_docdirs=(MANUAL
		MANUALHTML
		MANUALPDF)
	cp -pR "${_docdirs[@]}" "$pkgdir/usr/share/doc/open-usp-tukubai/" # XXX should I do with install(1)?

	# license file please
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/open-usp-tukubai/"
}
