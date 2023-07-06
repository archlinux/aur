# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=adwaita-for-steam-git
pkgver=1.3.r0.g8eb87ed
pkgrel=1
pkgdesc='A skin to make Steam look more like a native GNOME app'
arch=(any)
url=https://github.com/tkashkin/${pkgname%-git}
license=(MIT)
depends=(cantarell-fonts)
optdepends=("steam: if you don't use the flatpak version of Steam")
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url ${pkgname%-git}.sh)
md5sums=('SKIP'
         '6642172c22e07cdce037e91a7424dd65')
install=adwaita-for-steam.install

pkgver()
{
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  install ${pkgname%-git}.sh -Dm755 "$pkgdir/usr/bin/${pkgname%-git}"
  cd ${pkgname%-git}
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  find colorthemes fonts web install.py -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
}
