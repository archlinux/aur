# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl
pkgver=2020.11.20.post1
pkgrel=0
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
source=("https://files.pythonhosted.org/packages/64/2f/dfc2a1ad86993e0385397dabbc7445d52470a26c8496e09f70c79cb4902c/ytmdl-2020.11.20.post1.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "${pkgname}-${pkgver}"
  	sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

build() {
	cd "ytmdl-${pkgver}"
	python setup.py build
}

package() {
	cd "ytmdl-${pkgver}"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -D "${pkgdir}/share/bash-completion/completions/ytmdl.bash" \
	   	"${pkgdir}/usr/share/bash-completion/completions/ytmdl"
	install -D "${pkgdir}/usr/share/zsh/functions/Completion/Unix/ytmdl.zsh" \
		"${pkgdir}/usr/share/zsh/site-functions/ytmdl"
}
