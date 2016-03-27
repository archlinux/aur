# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2016.03.26
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
	    'atomicparsley: for embedding thumbnails into m4a files')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz
        http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig)
sha1sums=('8016ef34e4afe9c66571c03523b42cb1e61b7b0c'
          'SKIP')
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18')

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
