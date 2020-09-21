# Maintainer: Lance Roy <ldr709@gmail.com>

pkgname="gtk-theme-material-black"
pkgver=1.8.8
pkgrel=1
commit_hash=08236a5885fd334cd8f728d8241ae820ba5c575f
pkgdesc="Dark themes based on Material Design standards. Includes icons."
url="https://www.gnome-look.org/p/1316887/"
arch=('i686' 'x86_64')
license=(GPL2)
repo_name="rtl88-Themes"
source=("https://github.com/rtlewis88/${repo_name}/archive/${commit_hash}.zip")
sha256sums=('97485fcdcdb543c22086c2c80a2c6b7da33d6972251fe00e881965943f0462c3')
options=(!strip)

prepare() {
  find "$repo_name-$commit_hash" -type f -print0 | xargs -0 chmod 644
}

package() {
  cd "$repo_name-$commit_hash"
  mkdir -p "$pkgdir/usr/share/themes/" "$pkgdir/usr/share/icons/"
  mv Material-Black-{Blueberry,Cherry,Lime,Mango,Pistachio,Plum}{,-3.36} "$pkgdir/usr/share/themes/"
  mv Material-Black-{Blueberry,Cherry,Lime,Mango,Pistachio,Plum}-{Numix,Numix-FLAT,Suru} "$pkgdir/usr/share/icons/"

  for hlcolor in Blueberry Cherry Lime Mango Pistachio Plum
  do
    oldname="MB-$hlcolor-Suru-GLOW"
    newname="Material-Black-$hlcolor-Suru-GLOW"
    sed -i "s/Name=$oldname/Name=$newname/" "$oldname/index.theme"
    mv "$oldname" "$pkgdir/usr/share/icons/$newname"
  done
}
