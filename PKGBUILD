pkgname=otrs
pkgver=3.2.9
itsmver=3.2.7
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
        "http://ftp.otrs.org/pub/otrs/packages/Support-1.4.6.opm"
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
            "Support-1.4.6.opm"
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
         '7d76aa4c439a2230bf317824423d13a0'
         'e33bbd5cad399630bfd5614f3a28be14'
         '7c235ee49cdad8c6b7b85e10f97c6975'
         '75667a2b919b98abc6ebff4c5b50926d'
         '7b3b869c9952a8ac45523297a5f88bf4'
         '13acb477058ad9025540b3df5ee445ba'
         '9724910bda2fd88029d7e88c5ca9abda'
         '6c2c389a141e12d1be4793c00aa651b8'
         'c095828fb4aade210835fb1250fcaf6b'
         '3a9342a8b7347bf47f832d58020beb9c'
         'aade92fc7df2b0a5507a6c23c09f7917'
         '693dfab8458e202d935f31f4c7128670'
         '97b5c54bc93a06129f4acfed9171562e'
         'cec1d57f6fc904d6b8ed4748ed07e92c'
         '384bb6437746686e18ff13e9bcea9f2f'
         'd7ad2163a76f2cc6792248cc648db939'
         'ae6352292a342eb4c200fcad73f9c300'
         '129d55b43b4c9ae3b300b2d14963c5d6'
         '620e8cf2b1a9b9bb0c0c0e3cb7a5aa19'
         '618f815328b9a5a8e262138ff7ca6d9b'
         '71050a96b257a33bf56a60a4040b0ba4'
         '7083a797c1a6a7da73fde4b3f289a9fe')
sha1sums=('198376bbc5b89567891e01703f1e8e5d8a5aa819'
          'ce27493933aa369870316dd1ac19c50201a751c6'
          '82926e2086c122d8beecea9071e6e0b4d2f82f08'
          '56d58b50beaa59bbaad05637fe4f1ff5dd746cae'
          '80c55d006b987843159903267c2fc4eff81a2162'
          '6a9744b405f5f82bc1a80a3d28dcb69077650591'
          '3e3cae4dbcf1ce8a4ed2948d927b600f492083dc'
          '75a87c8c9d07a36fa2816ab7213313781bfed811'
          '05370412168df7233634d8b48221ae0922d687e8'
          '232a8412b361b8cc0c3faf0ab24cb19bce2dd6bc'
          '5362cc6fc56d8b5e2a9b208c8d5789213bba5576'
          'd0bae4ccae03338b6bd7a316571ac30b7e2f7102'
          '06b0f08497e33bf243b34c075507367baeaca071'
          '70fa01141d502acd7b1618a7b7c21e3774173161'
          '319c419b4533b7daa66a5decbb61fb2a7f945105'
          'a55a04cf4ec9cbcffaef88aeed3432e7b8e527b3'
          '9925532ef5c381428e0eccbcc0430afb2330abaf'
          '15c96ac4728994304815daf6a0a82da0b2b3bd6e'
          '4ade92ba589dc6c874d61e5b7f25949115522aae'
          '4eee8c22cb3d652b79efdf3df0daa1fedfbbaeff'
          '3f44f7f7868874a8d9d940b11ba624f3633b6c54'
          '04eddb1f929d2e8967ebdab751bb291d0cf84341'
          '0f0e466b1e25ab0ff4554e953b5f5804fab65efa')
