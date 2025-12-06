# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
pkgname=hyprwallhaven-bin
_pkgname=hyprwallhaven
pkgver=0.1.1
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

sha256sums=('f7e69591a369e5cb91dbd0bf1348e8080b1dded6da599bd7f9e5acb762d5dad2')
sha256sums_x86_64=('751a9decb2a2a3594f8808010683429a90cfac59c68667cb8c7a71c5e90cbf9d')
sha256sums_aarch64=('3c36edb4552defaa322cb18d1898ec3295f48fecee97d45f23273c64b34c0720')

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
}
