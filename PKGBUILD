# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.01.08
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.com/youtube-dl/"
license=('custom')
depends=('python2')
makedepends=('python2-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('ca1e2443c1a7834ee0ceca105c2fffd0cc2df462'
          'b7d9fa1de1fb31e31fd0ee5996fdbf506e893ab0')

package() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's|etc/bash_completion.d|share/bash-completion/completions|' \
         -e 's|youtube-dl.bash-completion|youtube-dl|' setup.py
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
