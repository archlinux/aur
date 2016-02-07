# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=aurora-themes
pkgver=3.18.20160229
pkgrel=1
pkgdesc="Easy On The Eyes GNOME Shell, GTK2, GTK3 and Cinnamon themes"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
optdepends=("gtk-engine-murrine: for GTK2 themes")
source=("${pkgname}.tar.gz::https://www.dropbox.com/s/4ik0pbbpsiqe4ci/Aurora-${pkgver%.*}.tar.gz?dl=1")
sha256sums=('eecedbcc5e9b56a296b2effc45c790df6ab7ef447cb17a6f0c04cccbac589075')

pkgver() {
  dir="$(echo Aurora-*)"
  echo -n "${dir##*-}."
  while read -rd $'\0'
  do
    if [[ "$REPLY" -gt "$max" ]]
    then
      max="$REPLY"
    fi
  done < <(find "$dir" -type f -exec stat --printf="%Y\0" '{}' +)
  date -d "@$max" +%Y%m%d
}

package() {
    install -d ${pkgdir}/usr/share/themes
    cp --no-preserve=mode -r ${srcdir}/Aurora-3.18/* ${pkgdir}/usr/share/themes
} 
