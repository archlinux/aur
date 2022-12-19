# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname='gourmand'
pkgver=1.0.0
pkgrel=4
pkgdesc="A recipe manager for desktop that can import recipes"
arch=('any')
url="https://github.com/GourmandRecipeManager/gourmand"
license=('GPL')
depends=('python-gobject' 'gtk3' 'python-pyenchant' 'gst-python' 'python-pillow' 'python-sqlalchemy1.3' 'python-lxml' 'python-cairo' 'python-requests')
makedepends=('python-pip' 'gendesk')
optdepends=(
  'python-beautifulsoup4: Webpage import plugin'
  'python-scrape-schema-recipe: Webpage import plugin'
  'python-selenium'
  'python-keyring'
  'python-ebooklib: EPub export plugin'
  'python-reportlab: Printing & PDF export plugin'
  'python-gtkspellcheck: Spell checking plugin'
  'nuspell: Spell checking'
  'hspell: Spell checking for Hebrew'
  'libvoikko: Spell checking for Finnish language'
  )
conflicts=('gourmet')
source=("$pkgname-$pkgver-py3-none-any.whl::$url/releases/download/$pkgver/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('9f1acf7098e62a8bca932ba43a9f1ee6b94978073824b96c5c1032fce23b12d4')

prepare() {
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
