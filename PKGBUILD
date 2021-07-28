# Maintainer: André Kugland <kugland at gmail dot com>

_pkglang=Sanskrit
pkgname=otf-murty-"$(echo "$_pkglang" | tr '[:upper:]' '[:lower:]')"
pkgver=1.1.23
pkgrel=1
pkgdesc="${_pkglang} Typeface from Harvard's Murty Classical Library of India (free for non-commercial/scholarly use)"
arch=(any)
url="https://murtylibrary.com/design-and-typography.php"
license=('custom')
source=("http://www.hup.harvard.edu/features/mcli/fonts/Murty-${_pkglang}.zip")
noextract=("${source[@]##*/}")
sha256sums=('8ad12a0e6fd706a2a842f39230f5612d0949cfb00f9328626c7fbebd182466cb')

prepare() {
  cd "$srcdir"
  rm *.otf >/dev/null 2>&1 || true
  rm ._*.* >/dev/null 2>&1 || true
  unzip -o -q -j Murty-"${_pkglang}".zip '*.otf' '*.txt'
  mv Murty*"${_pkglang}"*".otf" "$_pkglang.otf"
}

package() {
  cd "$srcdir"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/Murty/" "${_pkglang}.otf"
  install -Dm0644 -t "$pkgdir/usr/share/fonts/${pkgname}/" "EULA-Murty-${_pkglang}.txt"
}
