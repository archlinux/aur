# Maintainer: grimi <grimi at poczta dot fm>

pkgname=emerald-icon-theme
pkgver=2.7
pkgrel=1
epoch=1
pkgdesc="Fresh and simple personality icon theme"
arch=('any')
url='https://www.gnome-look.org/p/1012534'
license=('GPL3')
depends=('hicolor-icon-theme')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1515376357/s/${_hash_time[0]}/t/${_hash_time[1]}/${pkgname}.tar.xz")
sha256sums=('5d7c5dfcf6ace0c859e7dbc2e11ca729eec3be9e5d267f2339cb185c0e7df2d8')


prepare() {
   cd ${pkgname}
   sed -i 's/\(Inherits=\).*$/\1breeze,Arc,elementary,Adwaita,hicolor/' Emerald/index.theme
}

package() {
   cd ${pkgname}
   find Emerald{,-Dark,-Matcha}/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Emerald{,-Dark,-Matcha}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/icons/{}" \;
}

