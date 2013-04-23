pkgname=otrs
pkgver=3.2.6
itsmver=3.2.4
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

package() {
  mkdir -p "${pkgdir}/srv/http/${pkgname}/"
  mkdir -p "${pkgdir}/srv/http/${pkgname}/extentions/"

  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/srv/http/${pkgname}/

  for _OPMFILE in ${_OPMFILES[@]}; do
    install -D -m 0644 "${srcdir}/${_OPMFILE}" "${pkgdir}/srv/http/${pkgname}/extentions/${_OPMFILE}"
  done

  install -D -m 0644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/httpd/conf/extra/${pkgname}.conf"

  chown -R 33:33 "${pkgdir}/srv/http/otrs/"
  chmod -R 775   "${pkgdir}/srv/http/otrs/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/log/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/stats/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/sessions/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/default/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/default/css/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Customer/"
  chmod -R 2775  "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Customer/default/"

  sed -i "s/\/opt\/otrs/\/srv\/http\/otrs/g" $(grep -rl "/opt/otrs" "${pkgdir}/srv/http/${pkgname}/")
}
md5sums=('ebfeabfba189816c4b10861289406840'
         'f0ae9b90828825382720f4422aa9c81d'
         '7457b9ee38b22be41eb188e6b7b55f40'
         '78700594371290cb5f3c651d0a4e1ce9'
         '351aa4a06eaf2dab6863a19a1cd0a347'
         'b8e0ea06f26e5fa87cc597d08034d94e'
         '497323ff765528bf6c4c0d89c29a43be'
         'f09ffd55ee69953b9d95abf452994314'
         'f959efe6979b5d82edcfb149b4416652'
         'a169832bbeb12a6a222530c123126f76')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '801b33c29f60eb93129f39ded0e3a3defed23ae8'
          '752cd9b085702cfc2d800f8bb26a08adadb6b157'
          '2fcdf103d3fde781468d795fcb6fa703c543ba17'
          '02b7e0287bb198e68681dc35cf41bd53b2b66c9b'
          'a26c34974e16ce2d729afcbda76dafe5e610495e'
          '3f3c2ce8b086c108b97115c532b413f80f4e2ad3'
          '06d8db63ebb592bf1ece6f1ff532811f84a8cce9'
          '92e34044862a8176b64a29c7107002ea259e6dad')