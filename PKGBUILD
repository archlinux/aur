# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2021-07-29.

_pkgname="firefox-developer-edition-firefox-symlink"
pkgname="${_pkgname}"
epoch=0
pkgver=91.0b7
pkgrel=1
pkgdesc="Provides a symlink from '/usr/bin/firefox-developer-edition' to '/usr/bin/firefox', to satisfy expectations of some software."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatt"
# url="http://chaps.cz/eng/download/idos-new/zip#kotvatt" # URL valid for the time when the timetable is still in the future.
license=('custom: public domain')
groups=("firefox")
depends=('firefox-developer-edition')
provides=("firefox=${pkgver}")
conflicts=('firefox')
makedepends=('firefox-developer-edition')

pkgver() {
  pacman -Qi firefox-developer-edition | grep -E '^Version[[:space:]]*:' | head -n 1 | awk -F ':' '{print $2}' | sed -E 's|-.*||' | tr -d '[[:space:]]'
}

source=('license-metapackage-pd.txt')
sha256sums=('1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -sv "firefox-developer-edition" "firefox"
  install -D -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
