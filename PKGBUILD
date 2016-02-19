# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# pls note, this is a binary package.
pkgname=armitage
pkgver=08.13.15
pkgrel=2
pkgdesc="Metasploit GUI Front ened written in java"
url="http://www.fastandeasyhacking.com/"
arch=('any')
license=('GPL')
depends=('metasploit' 'java-environment' 'postgresql')
conflicts=('armitage-svn')
install='armitage.install'

source=( 'http://www.fastandeasyhacking.com/download/armitage150813.tgz'
         'armitage.install' 'armitage.desktop' 'metasploit.png' 'metasploit.sh' 'database.yml')

sha256sums=('288065a8b779b6a4f4acaa0332f2ebbfd022529f600e4bf70cd494d84860f6ac'
            'd5a89e87e81e0169652147681a7c17657b8ced14f90e0e38fa15fac4b6ad5a8d'
            '02c829495ebfb171146e2b02f1c2470f814c41b6c80f0649f59ac62609d18689'
            '7d25e47bbd5cd710020c30fb645229a774672c7bcb451a0cf2fd6ba327d8b141'
            '7869413529c5529b9a0f2bcaaa2be1480382c2f91eb505e43a4f9e1c1eab2d71'
            'b4b4e77895712d16ab9d7402ee53fafcb34c667b7394ae7136d6686be8ee1a2f')

package() {
  cd "${srcdir}/${pkgname}"
  cat > armitage << EOF
#!/bin/sh
cd /opt/armitage
source /etc/profile.d/metasploit.sh
java -XX:+AggressiveHeap -XX:+UseParallelGC -jar armitage.jar $@
EOF
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -ra "${srcdir}/${pkgname}/" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/armitage.desktop" "${pkgdir}/usr/share/applications/armigate.desktop"
  install -Dm644 "${srcdir}/metasploit.png" "${pkgdir}/usr/share/icons/metasploit.png"
  install -Dm755 "${srcdir}/metasploit.sh" "${pkgdir}/etc/profile.d/metasploit.sh"
  install -D644 "${srcdir}/database.yml" "${pkgdir}/usr/share/metasploit/database.yml.sample"
}

# vim:set ts=2 sw=2 et:

