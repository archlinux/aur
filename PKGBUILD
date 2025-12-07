# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
pkgname=hyprwallhaven-bin
_pkgname=hyprwallhaven
pkgver=0.2.1
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

sha256sums=('b79b4fdda6d59ee6e40cedb93191def9aaabc6d422c817b8675f4a20416443cb')
sha256sums_x86_64=('c827b2bc2423ed86a680ea67f79729b5cde1d41cb314d0d097cdd4d5845f3a80')
sha256sums_aarch64=('0af785fd4404c8715212dd683baa64b6ff4b1ee346c1b2d3eb75985ef70d6ccd')

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
