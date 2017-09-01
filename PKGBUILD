# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_pkgname=nativefier-freedesktop
pkgname=${_pkgname}-git
_commit=9dde2b2 # 7 digits
pkgver=20170430
pkgrel=1
pkgdesc="Script to automate the installation of Nativefier (Electron) web apps"
arch=('any')
url="https://github.com/alxlg/nativefier-freedesktop"
license=('CPL')
depends=('nodejs-nativefier' 'kdialog')
install="${pkgname}.install"
source=("${_pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd "${_pkgname}"

  # Script files
  install -Dm755 nativefier-freedesktop \
    "${pkgdir}/usr/bin/nativefier-freedesktop"
  install -Dm755 url2webapp \
    "${pkgdir}/usr/bin/url2webapp"

  #xdg-mime file
  install -Dm644 web-app.xml \
    "${pkgdir}/usr/share/mime/packages/web-app.xml"

  # kservices5 file
  install -Dm644 install-webapp.desktop \
    "${pkgdir}/usr/share/kservices5/ServiceMenus/install-webapp.desktop"

  # Desktop files
  install -Dm644 nativefier-freedesktop.desktop \
    "${pkgdir}/usr/share/applications/nativefier-freedesktop.desktop"
  install -Dm644 url2webapp.desktop \
    "${pkgdir}/usr/share/applications/url2webapp.desktop"

  # Doc files
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim:set ts=2 sw=2 cc=80 et:
