# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=adwaita-for-steam-git
pkgver=0.29.r2.g9492a7c
pkgrel=1
pkgdesc='A skin to make Steam look more like a native GNOME app'
arch=(any)
url=https://github.com/tkashkin/${pkgname%-git}
license=(MIT)
depends=(sssm cantarell-fonts)
optdepends=("steam: if you don't use the flatpak version of Steam")
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)
install=adwaita-for-steam.install

pkgver()
{
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  cd ${pkgname%-git}
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname%-git}
  find Adwaita -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/steam/skins/{}" \;
}
