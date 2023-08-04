# Maintainer: Lance Roy <ldr709@gmail.com>

pkgname="gtk-theme-material-black"
pkgver=2.9.9_04
pkgrel=1
commit_hash=982e0538a7fcd031b6173f6e9ba8fade39c9b3a4
pkgdesc="Dark themes based on Material Design standards. Includes icons."
url="https://www.gnome-look.org/p/1316887/"
arch=('i686' 'x86_64')
license=(GPL2)
repo_name="GTK"
source=("https://github.com/rtlewis1/${repo_name}/archive/${commit_hash}.zip")
sha256sums=('e66282c3913adfb2d5f0ab080a8160cd19d28baf096a979e4a77af03af9c5f82')
options=(!strip)

prepare() {
  find "$repo_name-$commit_hash" -type f -print0 | xargs -0 chmod 644
}

package() {
  cd "$repo_name-$commit_hash"
  mkdir -p "$pkgdir/usr/share/themes/" "$pkgdir/usr/share/icons/"

  for hlcolor in Blueberry Cherry Lime Mango Pistachio Plum
  do
    for suffix in BE LA
    do
      oldname="Material-Black-$hlcolor"
      newname="Material-Black-$hlcolor-$suffix"
      sed -i "s/\(Name\|Theme\)=$oldname\$/\1=$newname/" "$newname/index.theme"
    done
  done

  mv Material-Black-{Blueberry,Cherry,Lime,Mango,Pistachio,Plum}{,-BE,-LA} "$pkgdir/usr/share/themes/"
}
