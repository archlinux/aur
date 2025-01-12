# Maintainer:

: ${_commit:=2c0540285e823e996a5276223807e2175515daae}

_fontname="gelasio"
_pkgname="ttf-$_fontname"
pkgbase="$_pkgname"
pkgver=1.008
pkgrel=2
pkgdesc="A serif font family metric-compatible with Georgia font family"
url="https://github.com/SorkinType/Gelasio"
license=('OFL-1.1-RFN')
arch=('any')

source=("Gelasio-LICENSE-${_commit::7}.txt"::"$url/raw/$_commit/OFL.txt")
sha256sums=('b393cb01867c919b44381512120dc3e4c954c7b47e2035c405f3a324799a4d29')

_files=(
  'fonts/ttf/Gelasio-Bold.ttf'::'e0ef3addf1acf35f5c6aef2be00d0a2c01363bf70a5950e16650976051a0c462'
  'fonts/ttf/Gelasio-BoldItalic.ttf'::'aa87e21b46aef3dcb50a68dc6e1946f0c0a9819d067e4be6a98a6daa8f5b3c16'
  'fonts/ttf/Gelasio-Italic.ttf'::'1d8bda4ff258bb8251eae4f7d7500c8d97d084136192bb264bc2305168765d1b'
  'fonts/ttf/Gelasio-Medium.ttf'::'dd316254b3de799f14148e83179450cf600cee3ce9f059fc931a0443c116ab44'
  'fonts/ttf/Gelasio-MediumItalic.ttf'::'414a89e3ef8bf1cf0e4c32ff755d57beca26e1fdd06e0d971069eb445f8d697c'
  'fonts/ttf/Gelasio-Regular.ttf'::'48c797fbe0e07c48a18cb962e7bdfa23f19618327dddf54093265328dc9eb39d'
  'fonts/ttf/Gelasio-SemiBold.ttf'::'f5eb3f3e395d1958bef5449bacda5e815aeab40cf40a24f71c2ad163c196a6ba'
  'fonts/ttf/Gelasio-SemiBoldItalic.ttf'::'9ab9c9363546116bea8296a66e0bde426cdcecebafc406c417cd4ade4188f48c'
  'fonts/variable/Gelasio-Italic[wght].ttf'::'52559e845a4d33514e5f93bb9ae7dbeae1894a53f2c565a15f18af40cd337c09'
  'fonts/variable/Gelasio[wght].ttf'::'4daecea457258c9ebeb8bc99ed3fd24353618bfad3ea4b93fa0b5d0468fc04e4'
)

for i in "${_files[@]}"; do
  _dl_path="${i%::*}"
  _file="${_dl_path##*/}"
  _hash="${i#*::}"

  _dl_path="${_dl_path//[/%5B}"
  _dl_path="${_dl_path//]/%5D}"

  source+=("${_file%.ttf}-${_commit::7}.ttf"::"$url/raw/$_commit/$_dl_path")
  sha256sums+=("$_hash")
done

pkgname=(
  ttf-gelasio
  ttf-gelasio-variable
)

package_ttf-gelasio() {
  for i in Gelasio-*[A-Za-z]-${_commit::7}.ttf; do
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/$_fontname/${i%-${_commit::7}.ttf}.ttf"
  done

  install -Dm644 "Gelasio-LICENSE-${_commit::7}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-gelasio-variable() {
  for i in Gelasio*\]-${_commit::7}.ttf; do
    install -Dm644 "$i" "$pkgdir/usr/share/fonts/$_fontname/${i%-${_commit::7}.ttf}.ttf"
  done

  install -Dm644 "Gelasio-LICENSE-${_commit::7}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
