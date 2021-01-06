# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

pkgname=atom-editor-beta-bin
_pkgver="1.54.0-beta0"
pkgver=1.54.0beta0
pkgrel=1
pkgdesc="A hackable text editor for the 21st Century"
arch=('x86_64')
license=('MIT')
depends=('gconf' 'git' 'nodejs' 'npm' 'libsecret' 'python' 'libx11' 'libxkbfile')
provides=('atom')
conflicts=('atom')
source=("https://github.com/atom/atom/releases/download/v${_pkgver}/atom-amd64.tar.gz"
        "https://raw.githubusercontent.com/atom/atom/master/resources/linux/atom.desktop.in")
md5sums=('545601dbe5d715b7b66145b67a072dcc'
         'edd7c80254eae752065ec9fd17915752')

package() {
  cd "atom-beta-${_pkgver}-amd64"

  install -d -m 755 "${pkgdir}/usr/share/applications"
  install -d -m 755 "${pkgdir}"/usr/lib
  install -d -m 755 "${pkgdir}"/usr/bin
  cp -r ./ "${pkgdir}"/usr/lib/atom

  sed -e "s|<%= appName %>|Atom|" \
      -e "s/<%= description %>/${pkgdesc}/" \
      -e "s|<%= installDir %>|/usr|" \
      -e "s|<%= appFileName %>|atom|" \
      -e "s|<%= iconPath %>|atom|" \
      ../atom.desktop.in > "${pkgdir}/usr/share/applications/atom.desktop"

  cd "${pkgdir}"/usr/bin
  ln -sf ../lib/atom/atom atom
}
