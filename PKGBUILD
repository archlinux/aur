# Maintainer: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlc
_gitname=yt-dlc
pkgver=2020.11.11_3
_gitpkgver="2020.11.11-3"
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
source=("https://github.com/blackjack4494/${_gitname}/archive/${_gitpkgver}.tar.gz")
sha256sums=('649f8ba9a6916ca45db0b81fbcec3485e79895cec0f29fd25ec33520ffffca84')

prepare() {
  cd ${_gitname}-${_gitpkgver}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${_gitpkgver}
  make PREFIX="${pkgdir}/usr"
}

package() {
  cd ${_gitname}-${_gitpkgver}
  make install PREFIX="${pkgdir}/usr"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
