# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2014.10.02
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz
        http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig)
sha1sums=('0d671e5dc3e4392057fddac18ee0fc1cc7b9b7d9'
          'SKIP')

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
