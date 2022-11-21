# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_uuid="clipboard-history@alexsaveau.dev"
_gitn=gnome-clipboard-history
_gitv=1.2.6
pkgname=gnome-shell-extension-clipboard-history
pkgver=21
pkgrel=1
pkgdesc="Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=("any")
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
license=("MIT")
depends=("dconf" "gnome-shell")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_gitv}.tar.gz")
sha256sums=('26cfe61fd9d85cd9d092efbe4de392237d2f1baaba42aa844968317376c6ba61')

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
