# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=semaphore
pkgver=1.0.0
pkgrel=1
pkgdesc="Accessible, simple and fast web client for Mastodon (pinafore fork)"
arch=('any')
url="https://github.com/NickColley/semaphore"
license=('GPL3')
makedepends=('yarn' 'nodejs')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NickColley/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e4c616a9d68edb7a9912b6bb523eb1e01fcfb697efa0058b682994cbf66a835d')
          

build() {
  cd "${pkgname}-${pkgver}"
  yarn --production --pure-lockfile
  yarn build
  yarn cache clean
  rm -rf ./src ./docs ./tests ./bin 
}

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"

  cp -a __sapper__/export/* "${pkgdir}/usr/share/webapps/${pkgname}"

  install -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

