pkgname=otrs
pkgver=3.2.1
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
         '699fbc2680aa15a15a4e05d6d6cc2add'
         'd908e6c26fbe6006a75241e37afd9bbf'
         'b7e42f5a775b4f0ab969cbd6fb48b26a'
         '4ff97e8e0e8240772210aeafa2f4d873'
         '48efabc541754692ae45795ed92af1b3'
         'aca5493833b7cc5095ecffca19f5dc96'
         'fce2f7b4f44c2cf1e810c3ff1a4d24c4'
         'e06fe2b50c81c6d1315dd1ee9d4d3a9b'
        )
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          'e3715e161c6170fa87b35118b91f2cb7b7a89fe6'
          'a5e6a1be3aead32300dfafe137732bb7e0a91fc7'
          'a596627dea5b74740042cac577c32aff45b4df8c'
          '5c2378156e01ae8ea0a823890f8628509a758351'
          'd00befc7961ef1f52c47f39c042bf3b19077b9dc'
          'a2268a459717330e81c7b5d85e231667a465480f'
          '2f0f9cd07232f4f7f3014b01be5fd971becc3e6b'
          '75e709dc69cf4aa4eda6a3ccf186a97b52b0e0a7')