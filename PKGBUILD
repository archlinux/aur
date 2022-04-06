# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_gitname=nativecontrol
_version=1.4
pkgname=firefox-socket-control-git
pkgver=${_version}.70a8ffe
pkgrel=1
pkgdesc="Control your Firefox using UNIX sockets."
arch=('any')
url="https://github.com/karabaja4/${_gitname}"
license=('MIT')
install=${pkgname}.install
depends=('firefox' 'openbsd-netcat' 'nodejs')
makedepends=('git')
source=("https://addons.mozilla.org/firefox/downloads/file/3932891/socketcontrol-${_version}-fx.xpi"
        "git+https://github.com/karabaja4/${_gitname}.git")
noextract=("socketcontrol-${_version}-fx.xpi")
sha256sums=('8e2c1e6bd19f0ecd7c0f93a77faa02b5d2dc469729120ed63e1de1fdc9de93c8'
            'SKIP')

pkgver() {
  cd "${_gitname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "socketcontrol-${_version}-fx.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/native_control@karabaja4.xpi"

  cd "${_gitname}"
  install -Dm755 "firefox-socket-control" "${pkgdir}/usr/bin/firefox-socket-control"
  install -Dm755 "app/socketcontrol.js" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/socketcontrol.js"
  install -Dm644 "app/socketcontrol.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/socketcontrol.json"
}
