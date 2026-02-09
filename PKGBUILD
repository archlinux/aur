# Maintainer: Djalel Oukid (sniper1720) <sniper1720@linuxtechmore.com>
_pkgname=elegant-sddm-archlinux-theme
pkgname=sddm-theme-elegant-archlinux-git
_basever=1.2.1
pkgver=1.2.1.r81.g629a459
pkgrel=1
pkgdesc="A simple and elegant SDDM theme for Arch Linux"
arch=('any')
url="https://github.com/sniper1720/elegant-sddm-archlinux-theme"
license=('CC-BY-SA-3.0')
depends=('sddm' 'qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" "$_basever" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  
  # Install Theme
  install -d "$pkgdir/usr/share/sddm/themes/elegant-archlinux"
  cp -r elegant-archlinux/* "$pkgdir/usr/share/sddm/themes/elegant-archlinux/"
  
  # Install Customizer Script
  install -Dm755 elegant-archlinux/customize.sh "$pkgdir/usr/share/sddm/themes/elegant-archlinux/customize.sh"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

install=elegant-archlinux.install
