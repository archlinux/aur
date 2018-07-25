# Maintainer: Adrian Petrescu <apetresc@gmail.com>
# Contributor: Benjamin Auder <benjamin * redua net>
# Contributor: Beej <beej@beej.us>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=gogui
pkgver=1.4.10
pkgrel=2
pkgdesc='SGF editor, can also be used for playing against engines'
arch=('any')
url='https://github.com/lemonsqueeze/gogui'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'docbook-xsl' 'java-environment')
source=("https://github.com/lemonsqueeze/gogui/releases/download/v$pkgver/gogui-$pkgver.zip")
sha256sums=('4a152f4affb09598064b1a4d9da566d5c974ce40f636777979ee555cdf060eb9')

prepare() {
  cd "gogui-$pkgver"

  sed -i '/^update-mime-database/d;/^update-desktop-database/d' install.sh
}

package() {
  cd "gogui-$pkgver"

  # Prepare directories that install.sh expects to find
  install -d "$pkgdir/usr/share/icons/hicolor/"{48x48/{apps,mimetypes},scalable/apps}
  install -d "$pkgdir/usr/share/"{applications,mime/{applications,packages}}

  ./install.sh -p "$pkgdir/usr" -s "$pkgdir/etc"

  # Remove any ref. to $pkgdir in packaged files
  grep -l -r $pkgdir $pkgdir|while read i; do
    sed -i 's|'$pkgdir'||' "$i"
  done
}

# vim: ts=2 sw=2 et:
