# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="retroarch-autoconfig-udev"
pkgname="$_pkgname-git"
pkgver=1.21.1.r6.gc730e2b
pkgrel=1
pkgdesc='udev joypad autoconfig for RetroArch'
url="https://github.com/libretro/retroarch-joypad-autoconfig"
license=('MIT')
arch=('any')

makedepends=('git')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="retroarch-joypad-autoconfig"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  depends+=('retroarch')

  cd "$_pkgsrc"

  mkdir -pm755 "$pkgdir/usr/share/libretro/autoconfig"
  cp -a udev "$pkgdir/usr/share/libretro/autoconfig/"

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
