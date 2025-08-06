# Maintainer:
# Contributor: lucy <lucy@luz.lu>

_pkgname="toilet-fonts"
pkgname="$_pkgname"
pkgver=1.1 # 23.03.2014
pkgrel=2
url="http://www.figlet.org/fontdb.cgi"
pkgdesc="Additional asciiart fonts for toilet"
arch=('any')
license=('NOASSERTION')

depends=('toilet')
optdepends=('jave: create cool ascii-art and figlets')

source=(
  'ftp://ftp.figlet.org/pub/figlet/fonts/ours.tar.gz'
  'ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz'
  'ftp://ftp.figlet.org/pub/figlet/fonts/international.tar.gz'
  'ftp://ftp.figlet.org/pub/figlet/fonts/ms-dos.tar.gz'
)
sha256sums=(
  '10184c883faa63e91c8c7d99f100fe2f76195221ff8863d29c1beef88f666e69'
  '2c569e052e638b28e4205023ae717f7b07e05695b728e4c80f4ce700354b18c8'
  'e6493f51c96f8671c29ab879a533c50b31ade681acfb59e50bae6b765e70c65a'
  'd3678a98b3b058ae4ded8525f51a1c53b3c6e6833793cf7cf98fcd9550ed7e70'
)

package() {
  local _files _target _dest _dir _fn
  mapfile -d '' -t _files < <(find "$srcdir" -type f -iname '*.flf' -print0)

  for _target in "${_files[@]}"; do
    _dest="usr/share/figlet"
    _dir=$(dirname "$_target")
    _fn=$(basename "$_target")

    if toilet -d "$_dir" -f "$_fn" test &> /dev/null; then
      install -Dm644 "$_target" -t "$pkgdir/$_dest/"
    fi
  done
}
