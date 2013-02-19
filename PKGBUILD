pkgname=otrs
pkgver=3.2.2
itsmver=3.2.1
pkgrel=1
pkgdesc="OTRS is the leading open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="http://www.otrs.com/"
license=("GPLv3")
depends=("apache>=2"
         "mariadb>=5.5"
         "perl>=5.8.8"
         "mod_perl>=2"
         "perl-crypt-ssleay"
         "perl-timedate"
         "perl-dbd-mysql"
         "perl-gdgraph"
         "perl-json"
         "perl-json-xs"
         "perl-lwp-protocol-https"
         "perl-mail-imapclient"
         "perl-apache-dbi"
         "perl-dbd-pg"
         "perl-net-dns"
         "perl-net-imap-simple-ssl"
         "perl-net-smtp-ssl"
         "perl-dbd-odbc" 
         "perl-net-smtp-tls-butmaintained"
         "perl-ldap"
         "perl-pdf-api2"
         "perl-yaml-libyaml"
         "perl-text-csv-xs"
         "perl-xml-parser")
backup=("etc/httpd/conf/extra/${pkgname}.conf")
install="${pkgname}.install"
source=("${pkgname}.conf"
        "${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMCore-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/GeneralCatalog-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMChangeManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMConfigurationManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMIncidentProblemManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMServiceLevelManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ImportExport-${itsmver}.opm")
_OPMFILES=("ITSMCore-${itsmver}.opm"
           "GeneralCatalog-${itsmver}.opm"
           "ITSMChangeManagement-${itsmver}.opm"
           "ITSMConfigurationManagement-${itsmver}.opm"
           "ITSMIncidentProblemManagement-${itsmver}.opm"
           "ITSMServiceLevelManagement-${itsmver}.opm"
           "ImportExport-${itsmver}.opm")
_HTMLPATH="${pkgdir}/srv/http/${pkgname}"
_EXTDIR="${_HTMLPATH}/extentions"

package() {
  mkdir -p "${_HTMLPATH}/"
  mkdir -p "${_EXTDIR}/"

  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${_HTMLPATH}/

  for _OPMFILE in ${_OPMFILES[@]}; do
    install -D -m 0644 "${srcdir}/${_OPMFILE}" "${_EXTDIR}/${_OPMFILE}"
  done

  install -D -m 0644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/httpd/conf/extra/${pkgname}.conf"

  chown -R 33:33 "${_HTMLPATH}/"
  chmod -R u=rwX,g=r,o=r "${_HTMLPATH}/"

  sed -i "s/\/opt\/otrs/\/srv\/http\/otrs/g" $(grep -rl "/opt/otrs" "${_HTMLPATH}/")
}
md5sums=('ebfeabfba189816c4b10861289406840'
         'f0ae9b90828825382720f4422aa9c81d'
         '5de2d7a4ecc887415911dcd07c940251'
         'a9f7bb69562408b6a76d280984ec75ca'
         '4b2f95524aaa166bd0a77de6f9286624'
         'c984040abf67311c0bd165f40f78ccef'
         '94a3598e7ec1e7a1a36404395a4c1202'
         'fcf26bdc3378bcae07336d0b7caba65d'
         '57d70425b23cd949ed7c537200476b26'
         'ceb6ea7583856e66354da0385aa6e779')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '146ad936e0e799c08d8a44b7b74bc9c9bfab4d7c'
          'c5a9c07a24b19c66ba2c5221acfe012bfcf60030'
          'c4824d27c9bb5f43325ab40bc11791c6a4fe5b2d'
          'b7a64e625a9f177d674c4b57f19f26de868349b7'
          '0cf608370e6e355c43f9d875917032244288429f'
          'f3261cea7d8d8a3f316fab6e9051b980d962c367'
          'ef4f19bedb4a2a90c2a99d005ffa46232a64e3b1'
          '398f39cb6968af725b70e4dadbc7d9fd5ca5673d')