# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=plasma6-applets-codexbar
_pkgname=codexbar-plasmoid
_plasmoid=com.github.psimaker.codexbar
pkgver=0.6.0
pkgrel=1
pkgdesc="AI coding provider usage in your KDE Plasma 6 panel, a Plasma port of CodexBar"
arch=('any')
url="https://github.com/psimaker/codexbar-plasmoid"
license=('MIT')
depends=('libplasma' 'plasma-workspace' 'plasma5support' 'ksvg' 'kcmutils' 'kirigami'
         'qt6-declarative' 'codexbar-cli>=0.43.0')
install="$pkgname.install"
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b34373bf013a34903eca3c0f601669303b82a3d6ddf2d880445e1e3d62e879a')

package() {
  cd "$_pkgname-$pkgver"

  # Same layout as `kpackagetool6 --install`: metadata.json + contents/
  local _dest="$pkgdir/usr/share/plasma/plasmoids/$_plasmoid"
  install -Dm644 metadata.json "$_dest/metadata.json"
  cp -r --no-preserve=ownership contents "$_dest/"
  # Normalize modes (GitHub tarballs are group-writable), keeping +x on scripts
  chmod -R u=rwX,go=rX "$_dest/contents"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
