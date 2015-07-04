# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: C0DEA350

pkgname=thunderbird-enigmail-bin
_pkg_main_ver=1.8
pkgver=${_pkg_main_ver}.2
pkgrel=1
pkgdesc="The Mozilla Thunderbird GnuPG encryption plugin for both 32 and 64 bit systems. Binary version."
arch=('i686' 'x86_64')
url="http://www.mozilla-enigmail.org/"
license=('MPL')
depends=("thunderbird")
makedepends=('unzip')
provides=('thunderbird-enigmail')
conflicts=('enigmail' 'thunderbird-enigmail' 'enigmail-cvs' 'thunderbird-enigmail-cvs' 'enigmail-bin')
replaces=('enigmail-64-bin' 'enigmail-bin')
options=(!strip)
install='thunderbird-enigmail-bin.install'
source=("http://www.mozilla-enigmail.org/download/release/${_pkg_main_ver}/enigmail-${pkgver}-tb+sm.xpi"{,.asc})
noextract=(enigmail-${pkgver}-sm+tb.xpi)
sha384sums=('SKIP'
            'SKIP')

package() {
  cd "$srcdir/"
  unzip -qo *.xpi
  _eid=$(grep "<em:id>" install.rdf | head -n 1 |cut -f 2 -d \>|cut -f 1 -d \<)
  mkdir -p "${pkgdir}/usr/lib/thunderbird/extensions/"
  unzip -qo -d "${pkgdir}/usr/lib/thunderbird/extensions/${_eid}" *.xpi
}

