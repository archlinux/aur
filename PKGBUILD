# Maintainer: Nobbele <realnobbele@gmail.com>
pkgname=unityhub-beta
pkgver=3.0.0beta.7
pkgrel=1
pkgdesc="Unity Hub beta"
arch=('x86_64')
url="https://unity.com/"
license=('custom')
depends=('nss' 'gtk3')
optdepends=('libappindicator-gtk3: The DEB says this an optional dependency')
provides=('unityhub')
source=(
  "$pkgname-$pkgver.deb::https://hub.unity3d.com/linux/repos/deb/pool/main/u/unity/unityhub_amd64/unityhub-amd64-3Beta.0.0-beta.7.deb"
  'license.txt'
)
sha256sums=(
  'd1af15a92a930e95c1c883449d823838546b1bc770d7254903eccaa0f2f17fc4'
  'f0eb3a4bb148bb7f426e4f5b97e891265ac487710cbcba9282518537c7b5d833'
)
OPTIONS=(!strip)

package() {
  tar -xf 'data.tar.bz2' -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf '/opt/unityhub/unityhub' "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

post_install() {
  update-mime-database /usr/share/mime
  update-desktop-database /usr/share/applications
}
