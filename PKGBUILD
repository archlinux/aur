# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=fastanime
pkgver=2.8.8
pkgrel=1
epoch=1
pkgdesc="FastAnime, anime site experience from the terminal."
arch=('x86_64')
url="https://github.com/Benex254/FastAnime"
license=('Unlicense')
makedepends=('python>=3.10' 'python-installer' 'python-build')
depends=('python'
         'python-click'
         'python-fastapi'
         'python-inquirerpy'
         'libtorrent'
         'python-plyer'
         'python-pytest'
         'python-requests'
         'python-rich'
         'python-thefuzz'
         'yt-dlp'
         'python-dbus'
         'python-pypresence')
optdepends=('mpv: video player'
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
provides=('fastanime')
install="${pkgname}.install"
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${srcdir}" || exit
    cd "FastAnime-${pkgver}" || exit
    python -m build --wheel
}

package() {
    cd "${srcdir}" || exit
    cd "FastAnime-${pkgver}" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/fastanime.bash "$pkgdir/usr/share/bash-completion/completions/fastanime"
    install -Dm644 completions/fastanime.zsh "$pkgdir/usr/share/zsh/site-functions/_fastanime"
    install -Dm644 completions/fastanime.fish "$pkgdir/usr/share/fish/vendor_completions.d/fastanime.fish"
}
sha256sums=('SKIP')
