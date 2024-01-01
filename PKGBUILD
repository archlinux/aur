# Maintainer:

## useful links
# http://www.stixfonts.org
# https://github.com/stipub/stixfonts

# basic info
_fontname="stix"
_pkgname="otf-$_fontname"
pkgbase="$_pkgname"
pkgname=(
  otf-stix
  ttf-stix-variable
)
pkgver=2.13.b171
pkgrel=1
pkgdesc="OpenType Unicode fonts for Scientific, Technical, and Mathematical texts"
url="https://github.com/stipub/stixfonts"
license=('OFL-1.1-RFN')
arch=('any')

# main package
_main_package() {
  _pkgsrc=""
  _tag="v2.13b171"
  _pkgver=$(pkgver)
  source=(
    "$_fontname-otf-static-$_pkgver.zip"::"$url/raw/$_tag/zipfiles/static_otf.zip"
    "$_fontname-ttf-variable-$_pkgver.zip"::"$url/raw/$_tag/zipfiles/variable_ttf.zip"
    "$_fontname-license-$_pkgver.txt"::"$url/raw/$_tag/OFL.txt"
  )
  sha256sums=(
    'b5ec34636e117ec97e71e6b89ad2718618184329bbb3d3be5d1e3b0f8ed52789'
    'd567c6c9a899665744e08391daeee1adbf039e109b10309855321b6c1a8f8acd'
    '0c8825913b60d858aacdb33c4ca6660a7d64b0d6464702efbb19313f5765861a'
  )
}

# common functions
pkgver() {
  local _pkgver=$(sed -E 's&^[^0-9]+&&; s&([a-z])&.\1&' <<< $_tag)
  echo "${_pkgver:?}"
}

package_otf-stix() {
  install -Dm644 static_otf/*.otf -t "$pkgdir/usr/share/fonts/${pkgname%-git}/"
  install -Dm644 "$_fontname-license-$_pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-stix-variable() {
  install -Dm644 variable_ttf/*.ttf -t "$pkgdir/usr/share/fonts/${pkgname%-git}/"
  install -Dm644 "$_fontname-license-$_pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# execute
_main_package
