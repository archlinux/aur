# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Rax Garfield <admin at dvizho.ks.ua>

pkgname=hunspell-uk
pkgver=4.9.0
pkgrel=1
pkgdesc="Ukrainian spelling dictionary"
arch=('any')
url='https://github.com/brown-uk/dict_uk'
license=('MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://github.com/brown-uk/dict_uk/releases/download/v${pkgver}/hunspell-uk_UA.zip"
	"https://github.com/brown-uk/dict_uk/releases/download/v${pkgver}/chrome_dict_uk-UA-${pkgver}.zip")
sha256sums=('da763d82508b745565ebb15c79e1e9ebe7115be201a263c92fa61777bb5367c0'
            '860c9b9341f62520a3dc1ebfbe8d4e82703f123be889e67dd17f5361a6222adb')

package() {
  install -dm755 "$pkgdir"/usr/share/hunspell
  install -m644 uk_UA.* "$pkgdir"/usr/share/hunspell

  # Install webengine dictionaries
  install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries
  install -m644 uk-UA*.bdic "$pkgdir"/usr/share/qt/qtwebengine_dictionaries

  # myspell symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd ${pkgdir}/usr/share/myspell/dicts
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename ${file}) .
    done
  popd
}
