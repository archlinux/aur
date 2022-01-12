# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>

pkgname=gnome-shell-extension-lunar-calendar
pkgver=27
pkgrel=2
pkgdesc="Display Chinese Lunar Calendar in panel"
arch=('any')
url="https://extensions.gnome.org/extension/675/lunar-calendar/"
license=('GPL3')
depends=('gnome-shell>3.41' 'unzip' 'lunar-date')
source=("https://extensions.gnome.org/extension-data/lunarcalailin.nemui.v27.shell-extension.zip")
md5sums=('315946a9a764c077cc21f2d2650e60da')

package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}
package_01_locate() {
  msg2 'Locating extension...'
  cd "$(find -name 'metadata.json' -execdir test -e extension.js \; \
    -printf '%C@ %h\n' | sort -nr | sed 's/^.* //;q' )"
  extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$extname"
}

package_02_install() {
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) \
    -exec install -Dm644 -t "$destdir" '{}' +
}

package_10_schemas() {
  msg2 'Installing schemas...'
  cp -r --no-preserve=ownership,mode schemas "$destdir"
  find -name '*.xml' -exec install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" '{}' +
}


