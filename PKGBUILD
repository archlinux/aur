# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.07.10
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
optdepends=('ffmpeg: for video post-processing')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('994e5cef88b5fa7c58f4bd24aae8ef5b188dfa8d'
          'SKIP')

prepare() {
  cd ${pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
    "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
