# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: skrewball <aur at joickle dot com>
# Contributor: Michael Wendland <dev at michiwend dot com>

_pkgname=arch-update
pkgname=gnome-shell-extension-arch-update
pkgver=60
pkgrel=1
pkgdesc="Convenient indicator for Arch Linux updates in GNOME Shell."
arch=('any')
url="https://github.com/RaphaelRochet/arch-update"
license=('GPL3')
depends=('fakeroot' 'gnome-shell' 'pacman-contrib')
conflicts=('gnome-shell-extensions-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a4cbc6184c253de7034b7171876248fb9bd0c65fe37eed3da78a388f156b9aee')


package() {
  cd "${_pkgname}-${pkgver}"
  local _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.xml *.css
  cp -r --no-preserve=ownership,mode icons "${_destdir}"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
