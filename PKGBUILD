# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>
  
pkgname='refind-theme-regular-git'
pkgver=r42.7a282d0
pkgrel=1
pkgdesc="A simplistic clean and minimal theme for rEFInd"
arch=('any')
url="https://github.com/bobafetthotmail/refind-theme-regular"
license=('AGPL3' 'custom:OFL' 'custom:Ubuntu Font License 1.0')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/bobafetthotmail/refind-theme-regular')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # Specify path to the refind directory
  _refind_home="$pkgdir/boot/EFI/refind"

  install -D "$srcdir/${pkgname%-git}/theme.conf" "$_refind_home/${pkgname%-git}/theme.conf"
  cp -r "$srcdir/${pkgname%-git}/fonts" "$_refind_home/${pkgname%-git}"
  cp -r "$srcdir/${pkgname%-git}/icons" "$_refind_home/${pkgname%-git}"

  warning 'To enable the theme add "include refind-theme-regular/theme.conf" at the end of refind.conf, and comment out or delete any other themes you might have installed.'
}
