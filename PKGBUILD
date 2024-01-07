# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=gog-thimbleweedpark-dlc-ransome-unbeeped
pkgver=1.0.958.18970
pkgrel=1
_upstream_pkgver_pkgrel=1.0.958.19330-1
pkgdesc='Play Thimbleweed Park with uncensored English audio. GOG version.'
_shortname="${pkgname#gog-}"

# Need to hard-code the ID because lgogdownloader doesn’t recognize
# the DLC by name
_gog_id='1858019230'

arch=('any')
url='https://www.gog.com/en/game/thimbleweed_park_ransome_unbeeped'
license=('custom')
depends=("gog-thimbleweedpark>=${_upstream_pkgver_pkgrel}")
makedepends=('lgogdownloader')
options=('!strip')
install="${pkgname}.install"
_setup_basename="${_shortname}_${pkgver%.*}_(${pkgver##*.})"

source=(
  "${_setup_basename}.sh::gogdownloader://${_gog_id}/en3installer0"
)

sha512sums=(
  '5f1525380efb9a0cee18f640f8e316d42ab0b67d0f5a56d382df3b70b4010108d507df3d28fe4691cfc13da42fc655876167eff0cb90b8cfc0583f4837f813cd'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

package() {
  echo >&2 'Packaging license'
  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/Thimbleweed Park - Ransome Unbeeped/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/End User License Agreement.txt"

  echo >&2 'Packaging DLC content'
  install -D -m 644 -t "${pkgdir}/opt/gog/thimbleweedpark/game" \
    "${srcdir}/data/noarch/game"/*
}
