# Maintainer: nomisge <nomisge @ live . de>
pkgbase=bawue-fonts
pkgname=('ttf-bawue' 'otf-bawue')
pkgver=1.0
pkgrel=1
pkgdesc='BaWue-FontFamily'
arch=('any')
url='https://design.landbw.de/corporate-design/basiselemente/typografie'
license=('unknown')
makedepends=('unzip')
# Users must provide BaWue.zip themselves.
# Place it in the same directory as this PKGBUILD before running makepkg.
source=('BaWue.zip')
sha256sums=('SKIP')

prepare() {
  if [[ ! -d "$srcdir/bawue" ]]; then
    error "Source BaWue.zip does not contain directory 'bawue/'."
    return 1
  fi
}

_install_font_format() {
  local extension="$1"
  local package_name="$2"
  local file rel
  local -a files=()

  mapfile -d '' -t files < <(
    find "$srcdir/bawue" -type f -iname "*.${extension}" -print0
  )

  if (( ${#files[@]} == 0 )); then
    error "No .$extension-files in 'bawue/'."
    return 1
  fi

  for file in "${files[@]}"; do
    rel=${file#"$srcdir/bawue/"}
    install -Dm644 "$file" "$pkgdir/usr/share/fonts/$package_name/$rel"
  done
}

package_ttf-bawue() {
  _install_font_format 'ttf' 'ttf-bawue'
}

package_otf-bawue() {
  _install_font_format 'otf' 'otf-bawue'
}

