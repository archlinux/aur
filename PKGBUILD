# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.02.22
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('d9c8a206ab402204772d6316653a81b0683b7b91'
          '4f804cb0bd493f189d8596ffbafc62e4a6cbf403')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's|etc/bash_completion.d|share/bash-completion/completions|' \
         -e 's|youtube-dl.bash-completion|youtube-dl|' setup.py
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
