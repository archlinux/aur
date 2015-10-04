# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="front-panel-designer"
pkgver="4.4.2"
pkgrel="1"
pkgdesc="Free CAD software that lets you design and order custom front panels and enclosures exactly to your specification."
arch=("i686" "x86_64")
url="http://www.frontpanelexpress.com/front_panel_designer/the_idea/"
license=("custom")
depends=("libpng12")

source=("front-panel-express.desktop" "front-panel-express-order.desktop")
md5sums=("73c1659746c9ded0a4619d15d810b6be" "c6e6f3eba58cf32708247caeba614b72")

case $CARCH in
  x86_64)
    source+=("http://www.frontpanelexpress.com/fileadmin/downloads/FrontDesign-US-$pkgver-amd64.tgz")
    md5sums+=("6be16ef6e40ee1107526c0806a79d5c2")
    ;;

  i686)
    source+=("http://www.frontpanelexpress.com/fileadmin/downloads/FrontDesign-US-$pkgver-i386.tgz")
    md5sums+=("e1001be19e7160348a6fd689f68e1571")
    ;;
esac

package() {
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/FrontDesign" "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/FrontDesign/bin/FrontDesign "$pkgdir/usr/bin/FrontDesign"
  ln -s /opt/FrontDesign/bin/FrontDesign-Order "$pkgdir/usr/bin/FrontDesign-Order"

  install -Dm 644 \
      "$srcdir/front-panel-express.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express.desktop"
  install -Dm 644 \
      "$srcdir/front-panel-express-order.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express-order.desktop"

  install -Dm 644 \
      "$srcdir/FrontDesign/share/FrontDesign/License/License.html" \
      "$pkgdir/usr/share/licenses/$pkgname/License.html"
  install -Dm 644 \
      "$srcdir/FrontDesign/share/FrontDesign/License/ThirdPartyLicenses.html" \
      "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyLicenses.html"
}
