# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=clyocloud
pkgver=2.0.4
pkgrel=1
pkgdesc="A sleek personal cloud storage and media streaming server built with Nuxt (stable version)"
arch=('any')
url="https://code.weexnes.dev/ClyoCloud"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=('clyocloud')
conflicts=('clyocloud-git')
options=('!strip')
install=clyocloud.install
source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/23/archives?revision=${pkgver}&format=tgz"
        "clyocloud.service")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  npm install
  npm run build
}

package() {
  # Install build output
  install -d "$pkgdir/opt/clyocloud"
  cp -r "$srcdir/.output/"* "$pkgdir/opt/clyocloud/"

  # Install systemd service
  install -Dm644 "$srcdir/clyocloud.service" "$pkgdir/usr/lib/systemd/system/clyocloud.service"
}
