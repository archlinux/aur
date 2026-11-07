# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Prebuilt release bundle of technitium-console, a static admin console for
# Technitium DNS Server. The server serves these files as-is; this package
# only lays them down and tells you how to point the server at them.
pkgname=technitium-console-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Modern admin console for Technitium DNS Server (prebuilt release bundle)"
arch=('any')
url="https://github.com/byGarcia/technitium-console"
license=('GPL-3.0-or-later')
# install.sh ships as a doc/helper and the .install message runs under sh;
# bash (base) satisfies both, declared so namcap stays quiet.
depends=('bash')
provides=('technitium-console')
conflicts=('technitium-console' 'technitium-console-git')
install=technitium-console.install
source=("https://github.com/byGarcia/technitium-console/releases/download/v${pkgver}/technitium-console.tar.gz"
        "https://raw.githubusercontent.com/byGarcia/technitium-console/v${pkgver}/install.sh"
        "https://raw.githubusercontent.com/byGarcia/technitium-console/v${pkgver}/LICENSE")
sha256sums=('264db7e504977a2db64e22c5b3d2a91e97ca9ce0f1f49a6dce3b0e0c9a5856a4'
            'SKIP'
            'SKIP')

package() {
  install -d "$pkgdir/usr/share/technitium-console"
  tar --no-same-owner -xzf "$srcdir/technitium-console.tar.gz" -C "$pkgdir/usr/share/technitium-console"
  chmod -R a+rX "$pkgdir/usr/share/technitium-console"

  install -Dm644 "$srcdir/install.sh" "$pkgdir/usr/share/doc/technitium-console/install.sh"
  chmod 0644 "$pkgdir/usr/share/doc/technitium-console/install.sh"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/technitium-console/LICENSE"
}
