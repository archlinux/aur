# Maintainer: lmartinez-mirror
pkgname=('sunpaper-git' 'sunpaper-wallpapers-git')
pkgver=r86.bc6c684
pkgrel=2
pkgdesc="Dynamic wallpaper changer based on local sunrise & sunset times"
arch=('any')
url="https://github.com/hexive/sunpaper"
license=('unknown')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd sunpaper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sunpaper-git() {
  depends=('sunwait' 'wallutils' 'bash')
  optdepends=('sunpaper-wallpapers: high-resolution complementary wallpapers'
              'wget: live weather mode support (requires an openweather API key)'
              'pywal: pywal mode support'
              'waybar: waybar mode support'
              'sway: sway oguri mode support'
              'oguri: sway oguri mode support')
  provides=('sunpaper')
  conflicts=('sunpaper')
  install="$pkgname.install"
  ############################################################################
  cd sunpaper
  install -Dm 755 sunpaper.sh "$pkgdir/usr/bin/sunpaper"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_sunpaper-wallpapers-git() {
  provides=('sunpaper-wallpapers')
  conflicts=('sunpaper-wallpapers')
  ############################################################################
  cd sunpaper
  find images -type f -exec install -Dm 444 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
