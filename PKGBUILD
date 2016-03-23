# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=aurora-themes
pkgver=3.18.20160321
pkgrel=1
pkgdesc="Easy On The Eyes GNOME Shell, GTK2, GTK3 and Cinnamon themes"
arch=('any')
url="http://opendesktop.org/content/show.php?content=170523"
license=('GPL3')
optdepends=("gtk-engine-murrine: for GTK2 themes")
source=("version.html::$url"
        "http://gnome-look.org/CONTENT/content-files/${url##*=}-Dark-Aurora.tar.gz")
sha256sums=('68991e89036a271fec7f8b6408416a6c2817f298ef326365117fe41b1b5222b5'
            '506332ec0d86b90f0e41be79875fa7b40bb923caf01c1412cf02020a6d056f28')

pkgver() {
  sed -n 's/.*<h1.*>Dark Aurora<\/h1>.*<span class="contentdata">\([^<]\+\)<\/span>.*/\1/p' \
    version.html | tr '\n' '.'
  while read -rd $'\0'
  do
    if [[ "$REPLY" -gt "$max" ]]
    then
      max="$REPLY"
    fi
  done < <(find */ -type f -exec stat --printf="%Y\0" '{}' +)
  date -d "@$max" +%Y%m%d
}

package() {
    install -d ${pkgdir}/usr/share/themes
    cp --no-preserve=mode -r ${srcdir}/*/ ${pkgdir}/usr/share/themes
} 
