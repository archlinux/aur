# Maintainer: Matt Pallissard <matthew.paul@pallissard.net>
# Contributor: Tom Wizetek <tom@wizetek.com>
# Contributor: koentje
# Contributor: Ian Taylor <ian at lorf dot orgs>
pkgname=apachedirectorystudio
_pkgname=ApacheDirectoryStudio
pkgver=2.0.0.v20150606
pkgrel=1
pkgdesc="Eclipse based LDAP browser and directory client"
arch=('i686' 'x86_64')
url="http://directory.apache.org/studio/"
license=('Apache')
depends=('java-runtime' 'gtk2')
[[ ${CARCH} = i686 ]] && _arch=x86 && md5sums=('d1b0106a05ef28898864bfdf279d69a9')
[[ ${CARCH} = x86_64 ]] && _arch=x86_64 && md5sums=('db74bc60580cdc8dbb60b5934ea3470d')
source=("http://www.us.apache.org/dist/directory/studio/${pkgver}-M9/${_pkgname}-${pkgver}-M9-linux.gtk.${_arch}.tar.gz")

package() {
  install -d -m 0755 ${pkgdir}/opt/${_pkgname}
  cp -a ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}
  install -d -m 0755 ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  ln -sf /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}

  cat > ${_pkgname}.desktop << EoF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Apache Directory Studio
Comment=${pkgdesc}
Exec=/opt/${_pkgname}/${_pkgname}
Icon=/opt/${_pkgname}/${_pkgname}.xpm
Terminal=false
Type=Application
Categories=Java;Network;
EoF

  install -D -m 0644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
