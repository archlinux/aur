# Maintainer: Eric Bélanger <eric@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=youtube-dl
pkgver=2016.09.27
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('dfae0d25cb515d17e7145b7ab0edf0c85f77ef4975aefe46719fdef0a5d4a879'
            'SKIP')
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18'  # Philipp Hagemeister
              '428DF5D63EF07494BB455AC0EBF01804BCF05F6B'  # Filippo Valsorda
              'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D') # Sergey M. 

prepare() {
  cd ${pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/completions|' setup.py
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
