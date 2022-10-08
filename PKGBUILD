# Maintainer: Barnabe di Kartola

pkgname=kde-snap-assist
pkgver=v1.6.2
pkgrel=1
pkgdesc="This KWin script for KDE Plasma suggests other window thumbnails on snap. It tries to replicate the famous Windows 10/11 feature of the same name."
arch=(any)
url="https://github.com/emvaized/kde-snap-assist"
license=(GPLv3)
depends=(kwin)
source=("git+${url}")
md5sums=(SKIP)

pkgver() {
    cd kde-snap-assist
    vergit=$(git tag | sort | tail -n1 | sed 's|v||')
    echo $vergit
}

package() {
  newname=$(echo $pkgname | sed 's/-//g')
  mv ${pkgname} ${newname}
  mkdir -p "${pkgdir}/usr/share/kwin/scripts/"
  rm -r "${srcdir}/${newname}/.git"
  rm -r "${srcdir}/${newname}/.github"
  rm -r "${srcdir}/${newname}/assets"
  cp -R "${srcdir}/${newname}" "${pkgdir}/usr/share/kwin/scripts/"
}
