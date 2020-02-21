# Maintainer: Barfin
pkgname=proton-ge-custom-bin
pkgver=5.1
pkgrel=2
pkgdesc="Compatibility tool for Steam Play (with GloriousEggroll patches)"
arch=(i686 x86_64)
url="https://github.com/GloriousEggroll/proton-ge-custom"
depends=(steam)
license=(custom)
makedepends=(wget)
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
  chmod g+rx /usr/share/proton-ge-custom
}
md5sums=('0dcae33c1d967ce5c57fce5d8d0c1a7d')