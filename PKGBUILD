# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2013.05.14
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-distribute')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('e2502f8261a69ec68c737182250d58e57735dd9e'
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
