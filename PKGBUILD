pkgname=otrs
pkgver=3.1.12
itsmver=3.1.7
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
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMCore-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/GeneralCatalog-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMChangeManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMConfigurationManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMIncidentProblemManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMServiceLevelManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ImportExport-${itsmver}.opm")
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
    install -D -m 0640 "${srcdir}/${_OPMFILE}" "${_EXTDIR}/${_OPMFILE}"
  done

  install -D -m 0640 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/httpd/conf/extra/${pkgname}.conf"

  chown -R 33:33 "${_HTMLPATH}/"
  chmod -R u=rwX,g=r,o=r "${_HTMLPATH}/"

  sed -i "s/\/opt\/otrs/\/srv\/http\/otrs/g" $(grep -rl "/opt/otrs" "${_HTMLPATH}/")
}
md5sums=('ebfeabfba189816c4b10861289406840'
         'f0ae9b90828825382720f4422aa9c81d'
         'db2aa63f73086abb86efa2ee13033c9f'
         '3d25d053215eda581477635d9e56f8bf'
         '94cd42ca848075e26161fb6d71402bb5'
         '5ac80e89c009fb4145ce2edc11ee2676'
         'c49c648c9cbbc7c0e1469ea52003d75e'
         '1f2399129287ff2c0a2d7616a5d93882'
         'cf8b6e657f87ef15abe286bda44b7bb2'
         '4bfa4c0028e37d3a22b211ee10e44ae9')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '216ebbe832e3b3f8d329bf6739e78fb5786b0123'
          '9cb5284b0604d5140513c3e6be99c8289ec35a82'
          'e0cc2cae78b6eb0337f22db3ea3fa22e13922fdd'
          'ef10729dd6cd10b38f1bcb14c52c999d219c5f01'
          'e284cb52c5a58f46aa684540a69a47aa31d1e3ae'
          'd6ed9750d0a3d83616ef2ed7cbb6de5f5905634d'
          'c9b7bcf4bbefdacac96bfd24ed5506029020b381'
          '8265089736d78292672fd20fb7c32b81be1bf431')