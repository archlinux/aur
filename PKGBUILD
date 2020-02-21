# Maintainer: Barfin
pkgname=proton-ge-custom-bin
pkgver=5.2
pkgrel=1
pkgdesc="Compatibility tool for Steam Play (with GloriousEggroll patches)"
arch=(i686 x86_64)
url="https://github.com/GloriousEggroll/proton-ge-custom"
depends=(steam)
license=(custom)
makedepends=(wget)
install=$pkgname.install
source=($url/releases/download/$pkgver-GE-$pkgrel/Proton-$pkgver-GE-$pkgrel.tar.gz)

package() {
  wget -nc $url/releases/download/$pkgver-GE-$pkgrel/Proton-$pkgver-GE-$pkgrel.tar.gz
  tar -zxf Proton-$pkgver-GE-$pkgrel.tar.gz
  cd Proton-$pkgver-GE-$pkgrel
  mkdir -p "$pkgdir"/usr/share/steam/compatibilitytools.d
  mkdir -p $pkgdir/usr/share/proton-ge-custom
  cp -r * "$pkgdir"/usr/share/proton-ge-custom
  mkdir -p "$pkgdir"/usr/share/steam/compatibilitytools.d
  cp compatibilitytool.vdf "$pkgdir"/usr/share/steam/compatibilitytools.d
  mv "$pkgdir"/usr/share/steam/compatibilitytools.d/compatibilitytool.vdf "$pkgdir"/usr/share/steam/compatibilitytools.d/protongeaur.vdf
  sed -i -e 's#"install_path" "."#"install_path" "/usr/share/proton-ge-custom"#g' "$pkgdir"/usr/share/steam/compatibilitytools.d/protongeaur.vdf  
}
md5sums=('184a317173ce0eb6c27597a1be0ebccc')
