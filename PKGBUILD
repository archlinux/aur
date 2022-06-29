# Maintainer: Sung Mingi <FiestaLake@protonmail.com>

pkgname=gnome-shell-extension-custom-hot-corners-extended
_pkgname=custom-hot-corners-extended
pkgver=17
pkgrel=2
# _pkgrev=
# _commit=
pkgdesc="A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions."
arch=('any')
url="https://github.com/G-dH/custom-hot-corners-extended"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/Ext-v${pkgver}${_pkgrev}.tar.gz")
# source=("Ext-v${pkgver}${_pkgrev}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('3371d9ac3442c9c16df82709d934d076d65c72b0b2ac4f0ab63ae51a3d1f8aae')

build() {
  cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
  # cd "${_pkgname}-${_commit}"
  make all
}

package() {
  cd "${_pkgname}-Ext-v${pkgver}${_pkgrev}"
  # cd "${_pkgname}-${_commit}"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -Dm644 -t "${_destdir}" metadata.json *.js
  for i in src/*
    do
      install -Dm644 -t "${_destdir}/${i}" ${i}/*
    done
  install -Dm644 -t "${_destdir}/resources" resources/*.gresource
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
