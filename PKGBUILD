# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_uuid="clipboard-history@alexsaveau.dev"
_gitn=gnome-clipboard-history
_gitv=1.3.4
pkgname=gnome-shell-extension-clipboard-history
pkgver=26
pkgrel=1
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=("any")
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
license=("MIT")
depends=("dconf" "gnome-shell")
conflicts=("gnome-shell-extension-clipboard-indicator")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_gitv}.tar.gz")
sha256sums=('d6d482c6a3089c687a5cf22e592a865df01869c0f244642d55747ceeec685cbc')

build() {
  cd "${_gitn}-${_gitv}"
  make update-pot update-po-files && make all
}

package() {
  cd "${_gitn}-${_gitv}"

  install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" metadata.json *.js *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale

  for locale in */
  do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
  done
}
