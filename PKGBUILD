# Maintainer: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlc
_gitname=yt-dlc
pkgver=2020.10.24
pkgrel=6
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
source=("https://github.com/blackjack4494/${_gitname}/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('252cc51baca7ceba21d0f5673a6ba72b058c8b6acf78c22db6509bac9760bae5')

prepare() {
  cd ${_gitname}-${pkgver}-${pkgrel}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${pkgver}-${pkgrel}
  make PREFIX="${pkgdir}/usr"
}

package() {
  cd ${_gitname}-${pkgver}-${pkgrel}
  make install PREFIX="${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
