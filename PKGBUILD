# Maintainer: executter <executter at hotmail dot com>

pkgname=mint-backgrounds-slideshow
pkgver=1.0
pkgrel=1
pkgdesc="Linux Mint backgrounds from 13 Maya onward, as a single Cinnamon slideshow collection"
arch=('any')
license=('various')
_releases=(maya nadia olivia petra qiana rebecca rafaela rosa
           sarah serena sonya sylvia tara tessa tina tricia
           ulyana ulyssa uma una vanessa vera victoria virginia
           wilma wallpapers)
depends=("${_releases[@]/#/mint-backgrounds-}")

build() {
  local _dir=/usr/share/cinnamon-background-properties _release
  {
    printf '<?xml version="1.0"?>\n'
    printf '<!DOCTYPE wallpapers SYSTEM "cinnamon-wp-list.dtd">\n'
    printf '<wallpapers>\n'
    for _release in "${_releases[@]}"; do
      printf '\n<!-- %s -->\n' "${_release^}"
      sed -n '/<wallpaper[ >]/,/<\/wallpaper>/p' "$_dir/linuxmint-$_release.xml"
    done
    printf '\n</wallpapers>\n'
  } > linuxmint-slideshow.xml
}

package() {
  install -Dm644 linuxmint-slideshow.xml -t "$pkgdir/usr/share/gnome-background-properties/"
}
