# Maintainer: Matt Pallissard <matthew.paul@pallissard.net>
# Contributor: Tom Wizetek <tom@wizetek.com>
# Contributor: koentje
# Contributor: Ian Taylor <ian at lorf dot orgs>
pkgname=apachedirectorystudio
_pkgname=ApacheDirectoryStudio
pkgver=2.0.0.v20151221
pkgrel=2
pkgm=10
pkgdesc="Eclipse based LDAP browser and directory client"
arch=('i686' 'x86_64')
url="http://directory.apache.org/studio/"
license=('Apache')
depends=('java-runtime' 'gtk2')
[[ ${CARCH} = i686 ]] && _arch=x86 && md5sums=('dc9765e8dc02b8203e6cae002a542c69')
[[ ${CARCH} = x86_64 ]] && _arch=x86_64 && md5sums=('950571cdd93360e0ff620cacc9b5046e')
source=("http://www.us.apache.org/dist/directory/studio/${pkgver}-M${pkgm}/${_pkgname}-${pkgver}-M${pkgm}-linux.gtk.${_arch}.tar.gz")

package() {
  install -d -m 0755 ${pkgdir}/opt/${_pkgname}
  cp -a ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}
  install -d -m 0755 ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  ln -sf /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}

  cat > ${srcdir}/${_pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Apache Directory Studio
Comment=${pkgdesc}
Exec=/opt/${_pkgname}/${_pkgname}
Icon=/opt/ApacheDirectoryStudio/features/org.apache.directory.studio.ldapbrowser.feature_2.0.0.v20151221-M10/studio.png
Terminal=false
Type=Application
Categories=Java;Network;
EoF

  install -D -m 0644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
