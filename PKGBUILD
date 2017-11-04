# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-11-04.

_pkgname=bahn-regio-entfernungsrechner
pkgname="${_pkgname}"
epoch=0
_year=17
_month=04
_day=11
pkgver="${_year}_${_month}_${_day}"
pkgrel=2
pkgdesc="Calculates tariff-kilometres for subscription tickets for DB regio. Upstream name: Entfernungsrechner für Fahrvergünstigungen."
arch=('i686' 'x86_64')
url="http://www.evg-online.org/deine-vorteile/services/service-meldungen/entfernungsrechner-fuer-fahrverguenstigungen/"
license=('custom')

groups=()

depends=(
  "wine"
)

makedepends=(
  "rename"
)

optdepends=()

provides=(
  "${_pkgname}-doc=${pkgver}"
)

conflicts=()
replaces=()


source=(
  "entfernungsrechner.zip::http://www.evg-online.org/fileadmin/Service/Entfernungsrechner/${_year}-"${_month}"-"${_day}"-entfernungsrechner_neu.zip"
  "entfernungsrechner.sh"
  "http://www.evg-online.org/fileadmin/user_upload/Entfernungsrechner_Benutzerhandbuch.pdf"
  "license-dummy.txt"
)

sha256sums=(
  "f9735ceffdf7cdabd6d38e2c40cac6beccabd1c2a27f1f673bfdf99c47a14a09"
  "8347288b3a402c8075e5ccc24d23f3ae123ebebedd4116ed5e2352cf1a7b24ac"
  "SKIP"
  "SKIP"
)

options=(
  "emptydirs"
)


package() {
  _instdirbase='/opt/entfernungsrechner'
  _instdir="${pkgdir}/${_instdirbase}"
  _execdir="${pkgdir}/usr/bin"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _licensedirbase="/usr/share/licenses/${pkgname}"
  _licensedir="${pkgdir}/${_licensedirbase}"
  
  install -v -d -m755 "${_instdir}"
  install -v -d -m755 "${_instdir}/doc"
  install -v -d -m755 "${_execdir}"
  install -v -d -m755 "${_docdir}"
  
  ls -1 "${srcdir}/Entfernungsrechner - Daten vom"*/* | while read _file; do
    install -v -D -m 644 "${_file}" "${_instdir}/$(basename "${_file}")"
    chmod 755 "${_instdir}"/*.[eE][xX][eE]
  done
  
  install -v -D -m755 "${srcdir}/entfernungsrechner.sh" "${_execdir}/entfernungsrechner"
  
  install -v -D -m644 "${srcdir}/Entfernungsrechner_Benutzerhandbuch.pdf" "${_instdir}/doc/Entfernungsrechner_Benutzerhandbuch.pdf"
  echo "${url}" > "${_instdir}/doc/info.url"
  chmod 644 "${_instdir}/doc/info.url"
  
  install -v -D -m644 "${srcdir}/license-dummy.txt" "${_licensedir}/license-dummy.txt"
    
  cd "${_docdir}"
  ln -v -s "${_instdirbase}/doc/Entfernungsrechner_Benutzerhandbuch.pdf" .
  ln -v -s "${_instdirbase}/doc/info.url" .
}
