# Maintainer: Aethar <elliott.ashby88@gmail.com>

_pkgname=viu
pkgname="${_pkgname}-media-git"
pkgver=3.2.7.r4.de8b6b7
pkgrel=3
pkgdesc="Viu, your browser anime experience, from the terminal."
arch=('x86_64')
url="https://github.com/viu-media/viu"
license=('Unlicense')
makedepends=('python>=3.10' 'git' 'uv' 'python-installer')
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
conflicts=('viu-media')
source=("git+${url}.git")
install="${_pkgname}.install"

build() {
    cd "${srcdir}" || exit
    cd "${_pkgname}" || exit
    uv build
}

package() {
    cd "${srcdir}" || exit
	cd "${_pkgname}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
	mv "$pkgdir/usr/bin/viu" "$pkgdir/usr/bin/viu-media"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/viu.bash "$pkgdir/usr/share/bash-completion/completions/viu"
    install -Dm644 completions/viu.zsh "$pkgdir/usr/share/zsh/site-functions/_viu"
    install -Dm644 completions/viu.fish "$pkgdir/usr/share/fish/vendor_completions.d/viu.fish"
}
sha256sums=('SKIP')
