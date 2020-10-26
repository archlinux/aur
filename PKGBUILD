# Maintainer: Ilya Elenskiy
# Contributor: Oystein Sture <oysstu@gmail.com>
# Contributor: Tassos Natsakis <7712382@eipieq.com>

_release='2020'
_short_release="${_release:2:4}"
_service_pack='0'
pkgname="labview-${_release}"
pkgver="${_service_pack}f1"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64')
license=("custom:LabVIEW-${_release}")
depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
makedepends=('sed' 'libarchive')
options=('!strip') # Avoid time consuming operations.
source=("file://labview-${_release}-core-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-desktop-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-examples-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-exe-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-help-${_short_release}.0.${_service_pack}-1.x86_64.rpm"        
        "file://labview-${_release}-ref-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://labview-${_release}-rte-${_short_release}.0.${_service_pack}-2.x86_64.rpm"        
        "file://nicurli-${_short_release}.0.0-f0.x86_64.rpm"
        "file://niexfinder-base-1.0-59.noarch.rpm"
        "file://niexfinder-exe-1.0-59.x86_64.rpm"
        "file://niexfinder-labview-${_release}-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://niexfinder-lib-${_release}-${_short_release}.0.${_service_pack}-1.x86_64.rpm"
        "file://nijsonmapi-${_short_release}.0.${_service_pack}-1.noarch.rpm"
        "file://nilvcli-3.0.0.49156-f4.x86_64.rpm"                
        "file://ni-python-interface-${_short_release}.0.0.49154-0+f2.x86_64.rpm"
        "file://ni-service-locator-${_short_release}.0.0.49152-0+f0.x86_64.rpm"    
        "file://nisslcerts-${_short_release}.0.0-3.0.noarch.rpm"
        "file://nissli-${_short_release}.0.0-f0.x86_64.rpm"            
        "file://nitdmsi-19.0.0.49152-f0.x86_64.rpm"
        "file://LICENSE.txt"
        "file://PATENTS.txt"
        "file://LV2020_f1LDevPatch.tgz")
sha256sums=('440ad6f0dd88f1015a3a68b55beec710886658f189a44f0c11683e9766171e66'
            '700a417687cc928b6ed4af536fa4c6755507c5c2073f4fa0819630518706a5e7'
            'a6d4f85c06de8d00629d2e781e769370dddcffe624c547ea57ade1ad1f399bf0'
            'b0892581d01df5a1df9ce637609dc3dfd5b5b83bf58e97b02c2a35ec81a300a5'
            '2b0595171fd4459cae9e16f48c9bcfa2afdc59ff955b6738ece0bd0b0385c69d'
            '5ce5a77ab8963a7097c4698d0d917dde920fde5a2f37bf956e2b3514aebd2443'
            '26be91869d66501a670f230402cbbe89e14b838565b151a759c504076f615184'
            'a3db25755a63a6df4525bb11883f440e2798d7ba8e67eabaa31e9c796a7d4dc7'
            '911a996e926cbb19f785e3390623dbd57f0e0af07f442af1d54a405086018813'
            '96b1f89fe496059ecd321c88cead2d23aa80cf183965f654cab67fd7a6a7d2fe'
            '0b3f3f0a11735c4d15a9091f083d7306d38a849de6a435911ce02fc0f4a8c572'
            'c8e84617cbf47d03a2332f4cd624d1e3a9d72d3cf477487006071630eb5bf616'
            '049af03eff27826ae468e4684c0538268bee3ebac502c5a66eb72f6dded990b2'
            'cc51ee323c4e684d5dab4e39c492480fba3cb30018e200c3a8bb32e018f4ab76'
            'ff189ce41f89fd766837551802ba90ad47470bd2b29830cad595cc7241c0c783'
            'a8c68bcb84d26a2e85489083d45b13566816e26ec751775a60e92962ea668cc0'
            'fd22b092deecf21e1ccc248cc1e9ccee9b4c68e949222233b7b0a103eb9cc042'
            'b8e469a6cf867d1e42cdd2913ecf049f40183bab7724f4b7b3907d51e86aa30a'
            '9ae56b74c29ef4c45638b72d4acb77b500e5cedea8805db5b2c00a76736a1bf4'
            'a2e8e7b6c315caf55ee120db96d49a2252022d5155641ae962292134c470322a'
            '73c55fae8f9a071d337a02ecc058eb52a275f9b428bb34f9bd439db6fb105bd3'
            'f1653775dd9f188bd2509e9c23ed85c1cf502eca315b2751386a3b13e3755969')

prepare() {
    cd ${srcdir}
    for file in ${source[@]}; do if [ ${file: -4} == ".rpm" ]; then bsdtar -xf "${file#file://}"; fi; done
}
            
            
package() {
  mkdir -p "${pkgdir}/opt"

  cp -rp "${srcdir}/usr/local/natinst" "${pkgdir}/opt/"
     
  mkdir -p "${pkgdir}/usr/share/licenses/LabVIEW-${_release}"
  cp "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/LICENSE.txt"
  cp "${srcdir}/PATENTS.txt" "${pkgdir}/usr/share/licenses/LabVIEW-${_release}/PATENTS.txt"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes"

  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/48x48/labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/48x48/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/natinst-labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/128x128/labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/labview.png"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/icons/128x128/natinst-labview.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/natinst-labview.png"

  for file in "${pkgdir}"/opt/natinst/LabVIEW-"${_release}-64"/etc/desktop/icons/48x48/application-x-*.png; do
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/48x48/mimetypes/
    cp "$file" ${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/
  done

  mkdir -p "${pkgdir}/usr/share/applications"
  sed "s,Exec.*,Exec=/opt/natinst/LabVIEW-${_release}-64/labview -launch "%F"," "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/apps/natinst-labview64-${_release}.desktop" > "${pkgdir}/usr/share/applications/natinst-labview-${_release}.desktop"

  mkdir -p "${pkgdir}/usr/share/mime/packages"
  cp "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/etc/desktop/mime/labview.xml" "${pkgdir}/usr/share/mime/packages"
  
  # apply patch 1
  cp -p "${srcdir}/labview" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
  cp -rp "${srcdir}/vi.lib" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
  cp -rp "${srcdir}/AppLibs" "${pkgdir}/opt/natinst/LabVIEW-${_release}-64/"
}

# vim:set et sw=2 sts=2:
