# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=beacon-git
_commit=7c9a583681ff82c53515bced9900401ab5faa88c
pkgver=1.0.0.r${_commit:0:7}
pkgrel=1
pkgdesc="A sleek and modern Minecraft server manager built with Nuxt (cutting-edge version)"
arch=('any')
url="https://code.weexnes.dev/Beacon"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=('beacon')
conflicts=('beacon')
options=('!strip')
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/24/archives?revision=${_commit}&format=tgz"
        "beacon.service"
        "beacon.sysusers")

build() {
  cd "$srcdir"
  npm install
  npm run build
}

package() {
  # Install build output
  install -d "$pkgdir/opt/beacon"
  cp -r "$srcdir/.output/"* "$pkgdir/opt/beacon/"

  # Install systemd service
  install -Dm644 "$srcdir/beacon.service" "$pkgdir/usr/lib/systemd/system/beacon.service"

  # Install sysusers config
  install -Dm644 "$srcdir/beacon.sysusers" "$pkgdir/usr/lib/sysusers.d/beacon.conf"
}
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
