# Maintainer: Tom Carrio <tom@carrio.dev>

pkgname=sqltabs-bin
_pkgname=sqltabs
pkgver=1.0.0
pkgrel=1
pkgdesc="Rich SQL client for Postgresql, MySQL, MS SQL, Amazon Redshift, Google Firebase (Firestore)"
arch=('x86_64')
url="https://www.sqltabs.com"
license=('GPLv3')
provides=('sqltabs')
conflicts=('sqltabs')
depends=('perl')
optdepends=(
  'nvm'
  'nodejs>=10'
)
source=(
  'https://github.com/sasha-alias/sqltabs/releases/download/v1.0.0/sqltabs.linux.tar.gz'
  'https://raw.githubusercontent.com/sasha-alias/sqltabs/master/LICENSE'
  'sqltabs.desktop'
)
sha256sums=(
  '67e15b5d8ed5e2baa176ac650b394c1f0fdeb6dc6e0e493f1ef3acc1569c1c82'
  '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
  '389342394f9fc044c8a5c2ebf3df8dec97b7def948d73980d6fcbf4fec3f3901'
)
package() {
  _pkg=sqltabs-linux-x64
  _target="${pkgdir}/opt/${_pkgname}/"

  nodeVersion="$(node -v | perl -lape 's/^v(\d+)\.\d+\.\d+.*$/$1/')"
  if [ -z "$nodeVersion" ] || [ $nodeVersion -lt 10 ]
  then
    echo "SQLTabs requires Node version 10 or higher"
    exit 1
  fi

  install -d "${_target}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkg}/logo.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -r "${srcdir}/${_pkg}"/* "${_target}" -R
}
