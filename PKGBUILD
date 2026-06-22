# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=beacon-git
_commit=844f7300b8a4f55ce6b5c4185617cc78ed4128ff
pkgver=1.0.0.r${_commit:0:7}
pkgrel=1
pkgdesc="A sleek and modern Minecraft server manager built with Nuxt (cutting-edge version)"
arch=('any')
url="https://code.weexnes.dev/minecraft_server_manager"
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
sha256sums=('6778e7dd96fdfc146569243e1d5928f461557958ee6ef040229f24331f0ded8c'
            '896ee60fd167ada26ba222693e394bd670a14339c83272b565ca1d1ca04b21cf'
            'a197ad3fb5f9286228c65c22a9eea85d28776ee3d555bba1c26032ae7f3c4218')
