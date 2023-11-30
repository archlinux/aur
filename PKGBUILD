# Maintainer: bbyte <bbyte@mailbox.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=languagetool-snapshot
_pkgname="${pkgname%-snapshot}"
_date=20231129
_revision=6.4
pkgver=$_revision.$_date
pkgrel=1
pkgdesc='Style and Grammar Checker for 25+ Languages (daily snapshot)'
arch=(any)
url='https://www.languagetool.org'
license=(LGPL)
depends=(java-runtime-headless)
optdepends=('java-runtime: needed for the GUI version'
            'libxtst: needed for the GUI version'
            'gtk3: GTK style for the GUI')
provides=("${pkgname%-snapshot}")
conflicts=("${pkgname%-snapshot}")
source=(https://www.languagetool.org/download/snapshots/LanguageTool-"$_date"-snapshot.zip
        https://gitlab.archlinux.org/archlinux/packaging/packages/languagetool/-/raw/2079fd41/languagetool.service
        https://gitlab.archlinux.org/archlinux/packaging/packages/languagetool/-/raw/2079fd41/languagetool.sh)
sha256sums=('e8727f832e3060ea854d62dc4cb45c80422b88dbd3062bc459230cd3fe34cffb'
            '628e59208af02dd41c678135ef6dd8b328905701301d8257316b388d36d6c52b'
            'e395fe51eb107365bb6e5456a2e1a144a60296e52554b8407f241e195e434359')

package() {
  install -d "$pkgdir"/usr/share/java/"$_pkgname"

  cd "$srcdir"
  mv LanguageTool-$_revision-SNAPSHOT "$pkgdir"/usr/share/"$_pkgname"
  install -D -m755 "$_pkgname".sh "$pkgdir"/usr/bin/"$_pkgname"
  install -D -m644 "$_pkgname".service "$pkgdir"/usr/lib/systemd/system/"$_pkgname".service

  cd "$pkgdir"/usr/share/"$_pkgname"
  mv languagetool{,-server,-commandline}.jar libs/ "$pkgdir"/usr/share/java/"$_pkgname"
}
