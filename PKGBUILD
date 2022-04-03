# Maintainer: skrewball <jason at joickle dot com>

pkgname=gnome-shell-extension-clipboard-history
_pkgname=gnome-clipboard-history
pkgver=11
_gh_version=1.1.2
pkgrel=2
epoch=1
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=(any)
url='https://github.com/SUPERCILEX/gnome-clipboard-history'
license=('MIT')
depends=('dconf' 'gnome-shell>=1:40')
source=("https://github.com/SUPERCILEX/${_pkgname}/archive/refs/tags/${_gh_version}.tar.gz")
sha256sums=('35cc349f43a12c9faeddeae944451398486044cdc4ad7b5e00dc7c074ac1e159')

build() {
  cd "${_pkgname}-${_gh_version}"
  make
}

package() {
  cd "${_pkgname}-${_gh_version}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
