pkgname=otrs
pkgver=3.2.10
itsmver=3.2.9
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
install="${pkgname}.install"
source=("${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz"
        # ITSM
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMCore-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/GeneralCatalog-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMChangeManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMConfigurationManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMIncidentProblemManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ITSMServiceLevelManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages32/ImportExport-${itsmver}.opm"
        # Packages
        "http://ftp.otrs.org/pub/otrs/packages/Benchmark-1.2.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Calendar-1.9.5.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FAQ-2.2.3.opm"
        "http://ftp.otrs.org/pub/otrs/packages/FileManager-1.4.9.opm"
        "http://ftp.otrs.org/pub/otrs/packages/iPhoneHandle-1.2.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/MasterSlave-1.1.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OpenNMS-1.2.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/OTRSMasterSlave-1.3.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.5.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/Survey-2.2.2.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemMonitoring-2.4.3.opm"
        "http://ftp.otrs.org/pub/otrs/packages/SystemStatus-1.6.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/TimeAccounting-2.2.1.opm"
        "http://ftp.otrs.org/pub/otrs/packages/WebMail-0.13.2.opm")
_ITSMFILES=("ITSMCore-${itsmver}.opm"
            "GeneralCatalog-${itsmver}.opm"
            "ITSMChangeManagement-${itsmver}.opm"
            "ITSMConfigurationManagement-${itsmver}.opm"
            "ITSMIncidentProblemManagement-${itsmver}.opm"
            "ITSMServiceLevelManagement-${itsmver}.opm"
            "ImportExport-${itsmver}.opm")
_PKGSFILES=("Benchmark-1.2.5.opm"
            "Calendar-1.9.5.opm"
            "FAQ-2.2.3.opm"
            "FileManager-1.4.9.opm"
            "iPhoneHandle-1.2.1.opm"
            "MasterSlave-1.1.2.opm"
            "OpenNMS-1.2.1.opm"
            "OTRSMasterSlave-1.3.1.opm"
            "Support-1.5.2.opm"
            "Survey-2.2.2.opm"
            "SystemMonitoring-2.4.3.opm"
            "SystemStatus-1.6.1.opm"
            "TimeAccounting-2.2.1.opm"
            "WebMail-0.13.2.opm")

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/extentions/"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/extentions/itsm"
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}/extentions/packages"

  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/

  for _ITSMFILE in ${_ITSMFILES[@]}
  do
    install -D -m 0644 "${srcdir}/${_ITSMFILE}" \
                       "${pkgdir}/usr/share/webapps/${pkgname}/extentions/itsm/${_ITSMFILE}"
  done
  for _PKGSFILE in ${_PKGSFILES[@]} 
  do
    install -D -m 0644 "${srcdir}/${_PKGSFILE}" \
                       "${pkgdir}/usr/share/webapps/${pkgname}/extentions/packages/${_PKGSFILE}"
  done

  chown -R 33:33 "${pkgdir}/usr/share/webapps/otrs/"
  chmod -R 775   "${pkgdir}/usr/share/webapps/otrs/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/log/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/stats/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/sessions/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/httpd/htdocs/skins/Agent/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/httpd/htdocs/skins/Agent/default/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/httpd/htdocs/skins/Agent/default/css/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/httpd/htdocs/skins/Customer/"
  chmod -R 2775  "${pkgdir}/usr/share/webapps/otrs/var/httpd/htdocs/skins/Customer/default/"

  sed -i "s/\/opt/\/usr\/share\/webapps/g" $(grep -rl "/opt" "${pkgdir}/usr/share/webapps/${pkgname}/")
}
md5sums=('8bc13e1c1baccae9c3ba01204f5d72e7'
         '12d2584493d9d0f5077d5d9536fc8425'
         'c4b451e805f335a607635f54f73b2746'
         '7eb85a9bbdb7c7afd3b19d393a3ecb43'
         '5d72eb1a642e8f170525048b45cfcf3a'
         '5427ea2345a2a8933d1707c0cb451017'
         '175da811714d67f8d7ca4d61444f3851'
         '100892aca6c7cee470d93d7ab1c22dbc'
         '6ac4cb1e97e8906bf3093da4a3d0b83b'
         'c095828fb4aade210835fb1250fcaf6b'
         '3a9342a8b7347bf47f832d58020beb9c'
         'aade92fc7df2b0a5507a6c23c09f7917'
         '693dfab8458e202d935f31f4c7128670'
         '97b5c54bc93a06129f4acfed9171562e'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         '384bb6437746686e18ff13e9bcea9f2f'
         'd7ad2163a76f2cc6792248cc648db939'
         'dcfa6860fdb662f60823c0db29edb2eb'
         '129d55b43b4c9ae3b300b2d14963c5d6'
         '620e8cf2b1a9b9bb0c0c0e3cb7a5aa19'
         '618f815328b9a5a8e262138ff7ca6d9b'
         '71050a96b257a33bf56a60a4040b0ba4'
         '7083a797c1a6a7da73fde4b3f289a9fe')
sha1sums=('198376bbc5b89567891e01703f1e8e5d8a5aa819'
          'ca6378df7593115def94c30d6b6b8735883b3337'
          '2ab8476b3b0918eb1da87e98901ec7aac5d8e9e9'
          '1ed0dcdcff5893c6d9256d97832e219f722f8afb'
          '79a7bd9745c4d86eaf0eda07634fde6ada838a06'
          '2dfa9e926ade6f56daf46e28c75c6bd3cd5f0129'
          '318a822820a0017dd37c7f28cd6ba562c82ba7d4'
          '19b7b3dc929c05b0671edadd48a2b867e51abce4'
          '4174f4c2d949b82d8343006031efb3acd535273d'
          '232a8412b361b8cc0c3faf0ab24cb19bce2dd6bc'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          'd0bae4ccae03338b6bd7a316571ac30b7e2f7102'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '70fa01141d502acd7b1618a7b7c21e3774173161'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          'a55a04cf4ec9cbcffaef88aeed3432e7b8e527b3'
          '9925532ef5c381428e0eccbcc0430afb2330abaf'
          '63001007a4088d44fd36554f9219d547ceb1f2af'
          '4ade92ba589dc6c874d61e5b7f25949115522aae'
          '4eee8c22cb3d652b79efdf3df0daa1fedfbbaeff'
          '3f44f7f7868874a8d9d940b11ba624f3633b6c54'
          '04eddb1f929d2e8967ebdab751bb291d0cf84341'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa')
