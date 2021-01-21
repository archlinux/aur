# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl-git
_pkgname=ytmdl
pkgver=2021.01.13.3.g8c29e79
pkgrel=1
pkgdesc="Download songs from YouTube with metadata from sources like Itunes and Gaana"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')
depends=(
		"python>=3.6"
		"ffmpeg"
		"youtube-dl"
		"python-mutagen"
		"python-beautifulsoup4"
		"python-colorama"
		"downloader-cli"
		"python-itunespy"
		"python-ffmpeg"
		"python-pysocks"
		"python-xdg"
		"python-requests"
		"python-lxml"
		"python-wheel"
		"python-youtube-search-git"
		"python-unidecode"
		"python-simber"
		"python-pydes"
		"python-urllib3"
		"python-rich"
		)
makedepends=("git" "python-setuptools")
optdepends=("tensorflow: Trim Support")
provides=("ytmdl")
conflicts=("ytmdl")
source=("$_pkgname::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed -r 's/-/./g'
}

prepare() {
	cd "$_pkgname"
	sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	echo $pkgdir
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# install -Dm644 "${pkgdir}/share/bash-completion/completions/ytmdl.bash" \
	#    	"${pkgdir}/usr/share/bash-completion/completions/ytmdl"
	# install -Dm644 "${pkgdir}/usr/share/zsh/functions/Completion/Unix/ytmdl.zsh" \
	# 	"${pkgdir}/usr/share/zsh/site-functions/_ytmdl"
}
