# Maintainer: Tomoaki Hashizaki <thashisaki@yahoo.com>
# Contributor: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contributor: eagletmt <eagletmt@gmail.com>
pkgname=ttf-ricty
pkgver=4.1.1
pkgrel=4
pkgdesc='Japanese TrueType font for developers by mixing Inconsolata and Migu 1M.'
arch=('any')
url='https://rictyfonts.github.io/'
license=('custom')
makedepends=('fontforge' 'ttf-inconsolata' 'ttf-migu')
install=ttf.install
source=(
  "ricty_generator-${pkgver}.sh::https://raw.githubusercontent.com/rictyfonts/rictyfonts.github.io/master/files/ricty_generator-${pkgver}.sh"
  "os2version_reviser.sh::https://raw.githubusercontent.com/rictyfonts/rictyfonts.github.io/master/files/os2version_reviser.sh"
  "OFL.txt::https://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=OFL_plaintext&filename=OFL.txt"
  "IPA_Font_License_Agreement_v1.0.txt::https://salsa.debian.org/fonts-team/fonts-ipafont/-/raw/master/IPA_Font_License_Agreement_v1.0.txt")
sha256sums=('86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d'
            'e8bd7f9e2688f17889c52e41bc97cf37b83cc6fa69f9f816ef74046c197b3bb0'
            'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3'
            '4c84dd528ec3044638ec346fc1ee27cd1eb95dfc04cbc6a881b3ca7a7f517e54')

build() {
  cd "$srcdir"
  chmod +x ./ricty_generator-${pkgver}.sh
  ./ricty_generator-${pkgver}.sh -dr0 /usr/share/fonts/TTF/{Inconsolata-Regular.ttf,Inconsolata-Bold.ttf,migu-1m-regular.ttf,migu-1m-bold.ttf}
}

package() {
  # Install fonts
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir"/*.ttf "$pkgdir/usr/share/fonts/TTF/"

  # Install licenses
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "IPA_Font_License_Agreement_v1.0.txt" "$pkgdir/usr/share/licenses/$pkgname/"

  # Install script
  echo "もし生成されたフォントの文字間隔が不自然に大きくなった場合、/usr/bin/$pkgname/os2version_reviser.shスクリプトを使って下さい"
  echo "If the spaces between full-width characters are unusually large, please use the /usr/bin/$pkgname/os2version_reviser.sh script"
  install -d "$pkgdir/usr/bin/$pkgname"
  install -m644 os2version_reviser.sh "$pkgdir/usr/bin/$pkgname"
}
