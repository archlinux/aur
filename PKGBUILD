# Maintainer: Igor Saric <karabaja4 at gmail dot com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_pkgname=mimejs
_version=0.1
pkgname=${_pkgname}-git
pkgver=${_version}.3a90bfb
pkgrel=1
pkgdesc='A replacement for xdg-open written in Node.js'
arch=('i686' 'x86_64')
url="https://github.com/karabaja4/mimejs"
license=('MIT')
depends=('file' 'bash' 'nodejs')
provides=('xdg-utils')
conflicts=('xdg-utils')
source=('git+https://github.com/karabaja4/mimejs.git')
md5sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  sed -i "12s/${_pkgname}/${_pkgname} ${_version}.$(git rev-parse --short HEAD)/g" "main.js"
}

pkgver() {
  cd "${_pkgname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/etc"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/mimejs"
  install -m 755 "main.js" "${pkgdir}/usr/lib/mimejs"
  cp -r "lib" "${pkgdir}/usr/lib/mimejs"
  ln -s "/usr/lib/mimejs/main.js" "${pkgdir}/usr/bin/xdg-open"
  install -m 644 "mime.json" "${pkgdir}/etc/mime.json"
}
