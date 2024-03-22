# Maintainer: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Benjamin Auder <benjamin * redua net>
# Contributor: Beej <beej@beej.us>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=gogui
pkgver=1.5.4a
pkgrel=1
pkgdesc='SGF editor, can also be used for playing against engines'
arch=('any')
url='https://github.com/Remi-Coulom/gogui'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'docbook-xsl' 'java-environment')
source=("${url}/releases/download/v${pkgver}/gogui-v${pkgver}-bin.zip")
sha256sums=('5b03df6d81754bd154ae0d22b17fe9db3b454054feb743fcc739caf9c698b867')

package() {
  cd gogui

  # Prepare directories that install.sh expects to find
  install -d "${pkgdir}/usr/share/icons/hicolor/"{48x48/{apps,mimetypes},scalable/apps}
  install -d "${pkgdir}/usr/share/"{applications,mime/{applications,packages}}

  ./install.sh -p "${pkgdir}/usr" -s "${pkgdir}/etc"

  # Remove any ref. to $pkgdir in packaged files
  grep -l -r $pkgdir $pkgdir|while read i; do
    sed -i 's|'$pkgdir'||' "$i"
  done
}

# vim: ts=2 sw=2 et:
