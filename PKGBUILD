# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_gitname=nativecontrol
_version=1.2
pkgname=firefox-socket-control-git
pkgver=${_version}.d4b058d
pkgrel=1
pkgdesc="Control your Firefox using UNIX sockets."
arch=('any')
url="https://github.com/karabaja4/${_gitname}"
license=('MIT')
depends=('openbsd-netcat' 'nodejs')
makedepends=('git')
source=("https://addons.mozilla.org/firefox/downloads/file/3908096/nativecontrol-${_version}-fx.xpi"
        "git://github.com/karabaja4/${_gitname}.git")
noextract=("nativecontrol-${_version}-fx.xpi")
sha256sums=('a91df1511816958328360daa1246058da31b6bae3b7bdde9e132c3f228d32f58'
            'SKIP')

pkgver() {
  cd "${_gitname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "nativecontrol-1.2-fx.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/native_control@karabaja4.xpi"

  cd "${_gitname}"
  install -Dm755 "app/native_control.js" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/native_control.js"
  install -Dm644 "app/native_control.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/native_control.json"
}
