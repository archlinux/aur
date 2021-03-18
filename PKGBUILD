# Maintainer: lmartinez-mirror
pkgname=('sunpaper-git' 'sunpaper-wallpapers-git')
pkgver=r81.1fa6b43
pkgrel=1
pkgdesc="Dynamic wallpaper changer based on local sunrise & sunset times"
arch=('any')
url="https://github.com/hexive/sunpaper"
license=('unknown')
# depends=('sunwait' 'wallutils' 'bash')
makedepends=('git')
optdepends=('wget: live weather mode support (requires an openweather API key)'
            'pywal: pywal mode support'
            'waybar: waybar mode support'
            'sway: sway oguri mode support'
            'oguri: sway oguri mode support')
provides=('sunwait')
conflicts=('sunwait')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd sunpaper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_sunpaper-git() {
  depends=('sunwait' 'wallutils' 'bash')
  cd sunpaper
  install -Dm 444 sunpaper.sh "$pkgdir/usr/bin/sunpaper"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_sunpaper-wallpapers-git() {
  depends=()
  cd sunpaper
  find images -type f -exec install -Dm 444 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
