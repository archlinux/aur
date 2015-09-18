# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

set -u
pkgname='docbook-dsssl'
pkgver='1.79'
pkgrel='5'
pkgdesc='DSSSL Stylesheets for DocBook'
#arch=('i686' 'x86_64')
arch=('any')
url='http://sourceforge.net/projects/docbook/files/docbook-dsssl-doc/'
license=('as-is')
depends=('sgml-common')
install="${pkgname}.install"
source=("http://download.sourceforge.net/project/docbook/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz" 'docbook-dsssl-stylesheets.Makefile')
sha256sums=('d5a199024a5fe0862bfaff9e3533817cd8d08bddf3cdfb5bfe6088cbb2cd62b3'
            '9dec10a3f0c4fbe860f4fecf49cf4470c875a95957871ab97cbeb36a484b3e14')

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  cp "${srcdir}/docbook-dsssl-stylesheets.Makefile" 'Makefile'
  make BINDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}/usr/share/sgml/docbook/dsssl-stylesheets-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/sgml/stylesheets/dsssl/"
  if [ -d '/usr/share/sgml/stylesheets/dsssl/docbook' ] &&
    [ ! -L '/usr/share/sgml/stylesheets/dsssl/docbook' ]
  then
    msg2 "Not linking /usr/share/sgml/stylesheets/dsssl/docbook to"
    msg2 "/usr/share/sgml/docbook/dsssl-stylesheets-${PV}"
    msg2 "as directory already exists there.  Will assume you know"
    msg2 "what you're doing."
  else
    ln -sf "/usr/share/sgml/docbook/dsssl-stylesheets-${pkgver}" "${pkgdir}/usr/share/sgml/stylesheets/dsssl/docbook"
  fi
  set +u
}
set +u
