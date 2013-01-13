# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.01.13
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
makedepends=('python2-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('99b580d1623d81f37bd022f39f1f45177b8e9c5f'
          '974dde576744823f487ed5f17d34ba7e26ae420b')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's|etc/bash_completion.d|share/bash-completion/completions|' \
         -e 's|youtube-dl.bash-completion|youtube-dl|' setup.py
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
