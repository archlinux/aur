# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
pkgname=hyprwallhaven-bin
_pkgname=hyprwallhaven
pkgver=0.2.2
pkgrel=1
pkgdesc="A CLI tool for managing Wallhaven wallpapers on Hyprland with fuzzel integration (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/AnatolyRugalev/hyprwallhaven"
license=('MIT')
depends=('fuzzel' 'hyprpaper')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

source=("https://github.com/AnatolyRugalev/hyprwallhaven/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-linux-amd64-v${pkgver}::https://github.com/AnatolyRugalev/hyprwallhaven/releases/download/v${pkgver}/hyprwallhaven-linux-amd64")
source_aarch64=("${_pkgname}-linux-aarch64-v${pkgver}::https://github.com/AnatolyRugalev/hyprwallhaven/releases/download/v${pkgver}/hyprwallhaven-linux-aarch64")

sha256sums=('817fc34ce4973a30090a0810a132923eb65ad00eb54c1c83d13e583aa42aa8ef')
sha256sums_x86_64=('e40c19db4f04144d14f66a7a645826abfdf211f53708216cc2c64dd617e32a06')
sha256sums_aarch64=('c7611f57a00c2b61c0521ecd06b2efc6c2f3fb5d27a98c11aa2f0e1e440f993b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  local bin_src=""
  if [ "$CARCH" = "x86_64" ]; then
      bin_src="${srcdir}/${_pkgname}-linux-amd64-v${pkgver}"
  elif [ "$CARCH" = "aarch64" ]; then
      bin_src="${srcdir}/${_pkgname}-linux-aarch64-v${pkgver}"
  fi

  install -Dm755 "$bin_src" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "contrib/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
}
