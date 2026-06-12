# Maintainer: Aspen Feltner <aspeninifeltner@gmail.com>

pkgname=nsui-beta28-bin
pkgver=28
pkgrel=1
pkgdesc="New Super Ultimate Injector for 3DS packaged for Wine"
arch=('x86_64')
url="https://wiki.hacks.guide/wiki/3DS:New_Super_Ultimate_Injector"
license=('custom')
depends=('wine')
makedepends=('unzip')
optdepends=(
  'wine-mono: .NET compatibility if NSUI does not start with your Wine setup'
)
provides=('nsui')
conflicts=('nsui')
options=('!strip')

source=(
  "Release_beta28_debug.zip::https://archive.org/download/thc-new-super-ultimate-injector-for-3ds/Release_beta28_debug.zip"
  "nsui.sh"
  "nsui.desktop"
  "icon.png"
)

sha256sums=('38e6c24901bb8c0d07b2380a0e0c88c6fe8e682c491eeba3706fe1315b5a9a8a'
            '9ad040cd9be41b0ff77172d2a8e4b4b8e306e86a916d30a5d8a051cd69dc06d0'
            'c5bbf869d6721d72be6f0a77dae2983d0fb95b17ebeca372ac53e197cca0a7e2'
            '954c43acda131594a928aa9cf3b41b0e5b112572d1f64884ecaf61bb6ad235e8')

package() {
  local exe_dir

  exe_dir="$(find "$srcdir" -type f -name 'New Super Ultimate Injector for 3DS.exe' -printf '%h\n' | head -n1)"

  if [[ -z "$exe_dir" ]]; then
    echo "Could not find NSUI executable in source archive." >&2
    return 1
  fi

  install -dm755 "$pkgdir/usr/share/nsui"
  cp -a "$exe_dir"/. "$pkgdir/usr/share/nsui/"

  find "$pkgdir/usr/share/nsui" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/nsui" -type f -exec chmod 644 {} +

  install -Dm755 "$srcdir/nsui.sh" "$pkgdir/usr/bin/nsui"
  install -Dm644 "$srcdir/nsui.desktop" "$pkgdir/usr/share/applications/nsui.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/nsui.png"
}
