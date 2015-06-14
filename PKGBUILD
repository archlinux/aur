# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=1.33
pkgrel=1
pkgdesc="A car driving and car combat mod for Quake III Arena/OpenArena"
arch=('any')
url="http://www.moddb.com/mods/quake-3-rally"
license=('unknown')
depends=('quake3')
makedepends=('unrar')
source=("http://ioquake3.org/files/mods/q3rally_v132.rar"
        "http://media1.gamefront.com/moddb/2010/02/01/qvms.7z")
noextract=("q3rally_v132.rar") # bsdtar fails on this
sha256sums=('89cc44cad536af96c84acb4f3286accc4e143169991e69474aca8bd6ea592f2a'
            '11ac74670b094c065903b62faea76b0d861990e630ea3044cc5b1c397109f151')

prepare() {
  rm -rf q3rally # makepkg doesn't clean the src/ directory

  mkdir q3rally
  cd q3rally
  unrar x "../q3rally_v132.rar"
}

package() {
  # Install v1.32
  mkdir -p "$pkgdir/opt/quake3"
  cp -dR q3rally "$pkgdir/opt/quake3"

  # Install v1.33 patch
  install -m 644 qvms.pk3 "$pkgdir/opt/quake3/q3rally"
}

# vim:set ts=2 sw=2 et:
