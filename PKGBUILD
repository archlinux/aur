# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.02.19
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('b49c6dae84efe8d836de731a5c01a129a5498537'
          '220ca0300932022dc0eca921466c6a1af94cdeb5')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's|etc/bash_completion.d|share/bash-completion/completions|' \
         -e 's|youtube-dl.bash-completion|youtube-dl|' setup.py
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
