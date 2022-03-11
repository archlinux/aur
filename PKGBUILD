# Maintainer: Peter Lamby <admin@peterlamby.de>
pkgname=hypnos-solanum
pkgver=0.2.0
pkgrel=1
pkgdesc='Frontend for Hypnos - The selfhosted audio cloud'
groups=('hypnos')
arch=('any')
url='https://git.sr.ht/~serra/Solanum'
license=('GPL3')
makedepends=('git' 'npm')
source=("git+https://git.sr.ht/~serra/Solanum#tag=v${pkgver}"
        "git+https://git.sr.ht/~serra/Soil#tag=v${pkgver}")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "${srcdir}/Solanum"
  git submodule init
  git config submodule.Soil.url "${srcdir}/Soil"
  git submodule update
  npm install
  npm run build -- --mode=production
}

package() {
  cd "${srcdir}/Solanum"

  install -Dm 644 dist/bundle.js "${pkgdir}/usr/share/webapps/solanum/bundle.js"
  install -Dm 644 dist/index.html "${pkgdir}/usr/share/webapps/solanum/index.html"
  install -Dm 644 dist/javascript.html "${pkgdir}/usr/share/webapps/solanum/javascript.html"
}
