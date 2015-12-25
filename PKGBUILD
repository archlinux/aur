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
sha256sums=('2bba0b992c276efbe592371ac646f76820a915ca68f15eff6ab8c0dce18937c5')

# The archive downloaded from Dropbox seems to change its hash without any
# evident content change. This could originate from the compression of these
# files on the fly, so recompressing it is an attempt to stabilize the checksum
# only dependent on the actual contents.
DLAGENTS=("https::/usr/bin/bash -c $(
  printf '%s\n' "${DLAGENTS[@]}" | sed -n 's/https::\(.*\)/\1/p' \
    | sed 's/-[^ ] %o //' | sed 's/ /\\ /g'
)\ |\ bsdtar\ -caf\ %o\ @-")

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
