# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=clyocloud-git
_commit=9f1bc3f05ca79bacf762866bf1483b8f1b5916a5
pkgver=1.0.0.r${_commit:0:7}
pkgrel=1
pkgdesc="A sleek personal cloud storage and media streaming server built with Nuxt (git version)"
arch=('any')
url="https://code.weexnes.dev/ClyoCloud"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=('clyocloud')
conflicts=('clyocloud')
options=('!strip')
install=clyocloud.install
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/23/archives?revision=${_commit}&format=tgz"
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
