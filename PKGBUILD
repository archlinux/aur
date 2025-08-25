# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=viu-media
_pkgname=viu
pkgver=3.2.7
pkgrel=3
pkgdesc="Viu, your browser anime experience, from the terminal. "
arch=('x86_64')
url="https://github.com/viu-media/viu"
license=('Unlicense')
makedepends=('python>=3.10' 'python-installer' 'python-build')
depends=('python'
         'python-click'
         'python-httpx'
         'python-inquirerpy'
         'python-pydantic'
         'python-rich'
         'python-plyer'
         'libtorrent'
         'python-lxml'
         'python-pypresence'
         'python-thefuzz'
         'python-pycryptodome')
optdepends=('mpv: video player'
            'yt-dlp: download videos'
            'webtorrent-cli: nyaa torrents'
            'ffmpeg: download hls streams' 
            'rofi: alternative ui'
            'fzf: alternative ui'
            'chafa: terminal image viewer'
            'icat: kitty terminal image viewer'
            'bash: preview script language'
            'ani-skip-git: skip anime openings'
            'ffmpegthumbnailer: local previews'
            'syncplay: watch with friends'
            'feh: image viewer (for manga mode)')
provides=('viu-media')
install="${_pkgname}.install"
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}" || exit
    cd "${_pkgname}-${pkgver}" || exit
    python -m build --wheel
}

package() {
    cd "${srcdir}" || exit
    cd "${_pkgname}-${pkgver}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir/usr/bin/viu" "$pkgdir/usr/bin/viu-media"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/viu.bash "$pkgdir/usr/share/bash-completion/completions/viu"
    install -Dm644 completions/viu.zsh "$pkgdir/usr/share/zsh/site-functions/_viu"
    install -Dm644 completions/viu.fish "$pkgdir/usr/share/fish/vendor_completions.d/viu.fish"
}
sha256sums=('SKIP')
