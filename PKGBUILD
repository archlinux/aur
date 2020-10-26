# Maintainer: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlc
_gitname=yt-dlc
pkgver=2020.10.26
pkgrel=1
pkgdesc="Fork of youtube-dl - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/blackjack4494/yt-dlc"
license=('custom')
depends=('python' 'python-setuptools')
makedepends=('git' 'pandoc' 'zip')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("https://github.com/blackjack4494/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('e0a777b90c55b8d8a64f0e1b7b2742d849484de00ef8055ffbc25fd7250148a2')

prepare() {
  cd ${_gitname}-${pkgver}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${pkgver}
  make PREFIX="${pkgdir}/usr"
}

package() {
  cd ${_gitname}-${pkgver}
  make install PREFIX="${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
