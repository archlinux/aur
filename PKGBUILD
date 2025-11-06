# Maintainer: Parker Young <parker at parker8283 dot net>
# Contributor: Muflone http://www.muflone.com/contacts/english/

# BUILD INSTRUCTIONS:
# -------------------
# Visit the URL listed below to download a copy of the IBM i Access Client Solutions ZIP file.
# This requires an IBMid to obtain, which is why this PKGBUILD file doesn't automatically download it.
# The ID is free, and as of 1.1.9.1, ACS is free to download as well.
# Place the ZIP file in the same directory as this PKGBUILD file, then run makepkg.
# Note that this PKGBUILD will install the "full" version of ACS. If you wish to customize the available
# plugins, edit the /opt/ibm/iAccessClientSolutions/AcsConfig.properties file after installation.

pkgname=iacs
pkgver=1.1.9.9
pkgrel=1
pkgdesc="Access Client Solutions is a Java based, platform-independent interface for IBM i systems."
arch=('x86_64')
url="https://www.ibm.com/support/pages/ibm-i-access-client-solutions"
license=('LicenseRef-IBM-IPLA')
depends=('glibc' 'gcc-libs' 'java-runtime>=8')
backup=("opt/ibm/iAccessClientSolutions/AcsConfig.properties")
options=('!debug')  # No reason to make this package, there's nothing debuggable here.
source=("file://IBMiAccess_v1r1.zip")
sha256sums=('7527cbcbea0735e9867f80b8804f4b20c5fdd65ebf3d6ff37f7e0d29f0e9b5b7')

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

package() {
  cd "${srcdir}"
  install -Dm 644 Linux_Application/acslaunch_64.desktop "${pkgdir}/usr/share/applications/IBM i Access Client Solutions.desktop"
  install -d "${pkgdir}/opt/ibm/iAccessClientSolutions"
  cp -Rpf Documentation "${pkgdir}/opt/ibm/iAccessClientSolutions"
  cp -Rpf Fonts "${pkgdir}/opt/ibm/iAccessClientSolutions"
  cp -Rpf Icons "${pkgdir}/opt/ibm/iAccessClientSolutions"
  install -Dm 755 Start_Programs/Linux_x86-64/acslaunch_linux-64 "${pkgdir}/opt/ibm/iAccessClientSolutions/Start_Programs/Linux_x86-64/acslaunch_linux-64"
  install -Dm 644 acsbundle.jar "${pkgdir}/opt/ibm/iAccessClientSolutions/acsbundle.jar"
  install -Dm 644 AcsConfig.properties "${pkgdir}/opt/ibm/iAccessClientSolutions/AcsConfig.properties"
}
