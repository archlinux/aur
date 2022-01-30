# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname='papyrus'
pkgver='6.0.0'
_eclipsever='2021-12'
pkgrel=1
pkgdesc='Graphical editing tool for UML based on eclipse.'
arch=('x86_64')
url='http://www.eclipse.org/papyrus/'
license=('EPL')
groups=()
depends=('java-runtime>=11' python perl bash)
makedepends=(tar)
provides=('papyrus')
conflicts=('papyrus')
sha256sums=('96bdce4f3f7d6fc87dc8ae9855d29aaaf83b172082b65c3c56562653bbc6f9e0'
            '0bf0ff5eacc3e955a01c171cc21d8c989707ed9eee668ce176d67cfae06c8608'
            '255f1d8b0277bb9e4a3f84d09294fe34a54485b29f67220733343f37db052b94'
            '4d9052948619d22979977455d1e87e69168d1a147b4c74490e1652586fd68280'
            '45387c39208b4e18f70059059729dfd06ed4c3393065aebd299072c6eec888ea')
source=(
  "http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/modeling/mdt/papyrus/rcp/${_eclipsever}/${pkgver}/papyrus-${_eclipsever}-${pkgver}-linux64.tar.gz"
  "papyrus.png"
  "papyrus.desktop"
  "papyrus.ini.patch"
  "papyrus"
)

build() {
  cd "$srcdir/Papyrus"
  rm -r features/org.eclipse.justj*
  rm -r plugins/org.eclipse.justj*

  patch papyrus.ini "$srcdir/papyrus.ini.patch"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/papyrus"
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/icons"
  mkdir -p "$pkgdir/usr/share/applications"

  install -m644 papyrus.png "$pkgdir/usr/share/icons/"
  install -m755 papyrus.desktop "$pkgdir/usr/share/applications/"

  cd "$srcdir/Papyrus"
  find . -type f -exec install -vDm755 {} "$pkgdir/usr/lib/papyrus/"{} \;

  install -m755 "$srcdir/papyrus" "$pkgdir/usr/bin/"
}
