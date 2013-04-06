# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.04.03
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('c338f77edce8a465900391829dab89ec5f63623b'
          'SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/"/usr/share/bash-completion/completions/youtube-dl.bash-completion \
    "${pkgdir}/"/usr/share/bash-completion/completions/youtube-dl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
