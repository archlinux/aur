# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.02.25
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('7f49d2d4156ba54922fbf047dcb732ca1da95568'
          'b289e4896dc5325112aec95dc48979b25c0fad8f')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/"/usr/share/bash-completion/completions/youtube-dl.bash-completion \
    "${pkgdir}/"/usr/share/bash-completion/completions/youtube-dl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
