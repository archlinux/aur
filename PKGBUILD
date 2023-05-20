# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl
pkgver=2023.2.28
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
    "python-simber>=0.2.6"
    "python-pydes"
    "python-urllib3"
    "python-rich"
    "python-musicbrainzngs"
    "python-ytmusicapi"
    "python-spotipy"
    "youtube-search-python"
    "python-brotli"
    "python-websockets"
    "python-pycryptodome"
)
makedepends=("git" "python-setuptools" "python-pip")
optdepends=("tensorflow: Trim Support")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/ef/99/a7de28eb06797d63126c5655590998d1389adf81547e4a876e678d1904f7/ytmdl-2023.2.28.tar.gz")
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
