# Its own pkgbase, NOT a split package of vgs-shell, and that is the entire
# point. makepkg fetches a pkgbase's sources before it knows which of its split
# packages you asked for, so while the assets lived in vgs-shell's PKGBUILD
# every `yay -S vgs-shell` downloaded ~1.0 GiB of wallpapers to install a ~71 MiB
# shell that does not use them. Separate pkgbases are what let the base install
# download only what it installs.
pkgname=vgs-shell-assets
pkgver=0.3.0
pkgrel=1
pkgdesc='Optional VGS themes, wallpapers, and bundled icon themes'
arch=('any')
url='https://github.com/vanillagreencom/vgs'
license=('MIT')
depends=('vgs-shell')
source=("$url/releases/download/v$pkgver/vgs-$pkgver-assets.tar.gz")
sha256sums=('cab6238a8217bbe08407403efba57cf9681f50202adcf7366111a4071f2ce448')

package() {
  cd "vgs-$pkgver-assets"
  DESTDIR="$pkgdir" VGS_THEME_BUNDLE=extras packaging/install-system.sh
}
