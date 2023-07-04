# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_pkgname=autohide-battery
pkgname=gnome-shell-extension-${_pkgname}
pkgver=41
pkgrel=1
pkgdesc="GNOME Shell extension to hide battery icon, if battery is fully charged and AC is connected"
arch=('any')
url="https://github.com/ai/autohide-battery"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=('gnome-shell-extension-autohide-battery-git')
install='gschemas.install'
source=(https://github.com/ai/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('1eb015b8a28232cf9542429bddfe11fd')


package() {
  cd "${_pkgname}-${pkgver}"

  local _uuid="autohide-battery@sitnik.ru"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  find . -type f -name "*.js" -exec install -Dm 644 {} ${_destdir}/{} \;
  install -Dm 644 metadata.json ${_destdir};

  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  install -Dm 644 'schemas/ru.sitnik.autohide-battery.gschema.xml' "$pkgdir/usr/share/glib-2.0/schemas/"
}

# vim:set ts=2 sw=2 et:
