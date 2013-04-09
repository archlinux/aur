pkgname=otrs
pkgver=3.2.5
itsmver=3.2.3
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

  chown -R 33:33 "${pkgdir}/srv/http/${pkgname}/"
  chmod -R 775 "${pkgdir}/srv/http/${pkgname}/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/log/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/stats/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/default/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Agent/default/css/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Customer/"
  chmod -R 2775 "${pkgdir}/srv/http/otrs/var/httpd/htdocs/skins/Customer/default/"

  sed -i "s/\/opt\/otrs/\/srv\/http\/otrs/g" $(grep -rl "/opt/otrs" "${pkgdir}/srv/http/${pkgname}/")
}
md5sums=('ebfeabfba189816c4b10861289406840'
         'f0ae9b90828825382720f4422aa9c81d'
         '2cded3a34bd4fca016596710abd90be4'
         'f8d2c969004a1728dc584e7aead4e85b'
         '293a7d1007753a51fa97a1b413d53cd4'
         '843138100f714424c2c977a1955889f9'
         '3b9cb7a2c04fdafeb1e01dcedded2ec4'
         'e6d28483cf68347023279fa3800c3afe'
         '82241031dc96ecee701bd2e9108afd6e'
         '373faaa4f828b21e0558386a31808e67')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '5bfe2a3b6a7bad286ce1b24dd8ba9b974c512810'
          '6b2aa06d09b1bdb37483a8a4da401121a5a21a2c'
          '48947dbe943cdf32957b943b8dadd2978aaa36ce'
          '9288d9c9f825563fe8e7a343110f73025702d54d'
          '591db5e85e3dc33fbdb8c125b73b5dc70f866c04'
          '969adc52bef58db698840a024ee42bf6512e5d78'
          'af44ce49f45daff23396374d508b7342d7f8d492'
          '06e661b6138de4c3a75305f7cfab6bfcce314bc9')