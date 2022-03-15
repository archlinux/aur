# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl
pkgver=2022.3.16
pkgrel=0
pkgdesc="Download songs from YouTube with metadata from sources like Itunes, Gaana, Deezer etc."
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')
depends=(
		"python>=3.6"
		"ffmpeg"
		"yt-dlp>=2022.03.08.1"
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
		"python-unidecode"
		"python-simber"
		"python-pydes"
		"python-urllib3"
		"python-rich"
		"python-musicbrainzngs"
		"python-ytmusicapi"
		"python-spotipy"
		"youtube-search-python"
		)
makedepends=("git" "python-setuptools")
optdepends=("tensorflow: Trim Support")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/75/72/7a202b29e9838f9e56bb31d18ebfd5fcf3489a2bb4917f022ed3e18c4e49/ytmdl-2022.3.16.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "${pkgname}-${pkgver}"
  	sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "${pkgdir}/share/bash-completion/completions/ytmdl.bash" \
	   	"${pkgdir}/usr/share/bash-completion/completions/ytmdl"
	install -Dm644 "${pkgdir}/usr/share/zsh/functions/Completion/Unix/ytmdl.zsh" \
		"${pkgdir}/usr/share/zsh/site-functions/_ytmdl"
}
