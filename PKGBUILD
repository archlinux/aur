# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="A Northstar installer, updater, and mod-manager (AppImage release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
_desktop=flightcore.desktop
_commit=c178623d47d99184d4c561589c501bdb3d6db15c
_url2=https://raw.githubusercontent.com/R2NorthstarTools/FlightCore/$_commit
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage"
        "$_url2/LICENSE"
        "$_url2/README.md"
        "$_url2/docs/assets/Square310x310Logo.png"
        "$_url2/docs/DEVELOPMENT.md"
        "$_url2/docs/FAQ.md")
sha256sums=('bf497f6387f3610df7a0f1cd81b6b9f14a85d18c37c504728fe76bc3143a2ca0'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=Installer/Updater/Launcher for Northstar' $_desktop
  sed -i '1 i\StartupWMClass=FlightCore' $_desktop
  sed -i '1 i\Icon=flightcore' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=env APPIMAGELAUNCHER_DISABLE=true flightcore %U' $_desktop
  sed -i '1 i\Name=FlightCore' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop
}

package() {
  install -Dm644 Square310x310Logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 desktop/$_desktop "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 DEVELOPMENT.md FAQ.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 flight-core_${pkgver}_amd64.AppImage "$pkgdir/usr/bin/$_pkgname"
}
