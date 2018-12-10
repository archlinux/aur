# $Id$
# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

pkgname=jenkins-lts
pkgver=2.150.1
pkgrel=1
pkgdesc='Extendable continuous integration server (lts)'
arch=('any')
url='https://jenkins.io'
license=('MIT')
depends=('java-runtime-headless=8' 'ttf-dejavu' 'libcups')
provides=('jenkins-ci')
conflicts=('jenkins-ci')
replaces=('jenkins-ci')
backup=('etc/conf.d/jenkins')
install='jenkins.install'
noextract=("jenkins-${pkgver}.war")
source=("jenkins-${pkgver}.war::http://mirrors.jenkins.io/war-stable/${pkgver}/jenkins.war"
        # Rename to force re-download on new version
        'jenkins.conf'
        'jenkins.service'
        'jenkins.tmpfiles'
        'jenkins.sysusers'
        'LICENSE')
sha512sums=('1158713b60923f7c1a3b90e403562a388ec3578f1a7ca267f91137a58571c26721075f63eda97b92bcf3ca360ce68d5129c9bd205b2ee138e13247d73da4e7a3'
            '3a8421cef3953d899c150609f959cf5d5dd6d08d079a5e0f48bfece4f3c80491722b9e90ef841fddb87401c226b8338297c5c4e83e55a33ef8d6e387de3048d0'
            'a336b006d3711abb75b49a2e12c09ee61cf3275a2cdbbd3676480e2f6ca8ba0fb4b9c08f3f9da193252c4fca827e9a1d5eaad847d0a889445693427ae1571fe7'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            '896cbc64eadb2f3bb9fa7fc26dbfc527b1823d8bff3158be7f1936cc250f55eeafe89079e1ceb8f3d269041662573ccbbb36248140b4ba24144a564366f8847a'
            '0df6479a600db395c12ad29ebda3120d00460338b9a6b15913e2245aa29212a3798c32e664ca70c8034146e2e0b573066deec9e3210198202f753994e1b83efa')

package() {
  install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm444 "jenkins-${pkgver}.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -Dm644 jenkins.service "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -Dm644 jenkins.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/jenkins.conf"
  install -Dm644 jenkins.sysusers "$pkgdir/usr/lib/sysusers.d/jenkins.conf"
  install -Dm644 jenkins.conf "$pkgdir/etc/conf.d/jenkins"
}

# vim:set ts=2 sw=2 et:
