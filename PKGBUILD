# Maintainer: JeppeX <jesperi dot luoto at gmail dot com>
# Upstream maintainer: Willem Mulder <14mRh4X0r@gmail.com>

_pkgname=passff-host
pkgname=$_pkgname-librewolf-git
pkgver=1.2.4
pkgrel=1
pkgdesc="Host app for the WebExtension PassFF. Ported to LibreWolf."
arch=(any)
url="https://github.com/passff/passff-host"
license=('GPL2')
depends=('python')
makedepends=(git jq)
provides=("passff-host-librewolf=${pkgver}")
conflicts=('passff-host-librewolf')
source=("$_pkgname::git+https://github.com/passff/passff-host.git")
sha384sums=('SKIP')

package() {
  cd "$_pkgname"

  sed -i -e s/_VERSIONHOLDER_/${pkgver}/g src/passff.py

  install -Dm755 src/passff.py \
    "${pkgdir}/usr/lib/librewolf/native-messaging-hosts/passff.py"
  jq '.path = "/usr/lib/librewolf/native-messaging-hosts/passff.py"' src/passff.json \
    > "${pkgdir}/usr/lib/librewolf/native-messaging-hosts/passff.json"
}

# vim:set ts=2 sw=2 et:

