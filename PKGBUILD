# Maintainer: Benjamin Asbach <archlinux-aur.${pkgname}@impl.it>

pkgname=jenkins-lts
pkgver=2.492.3
pkgrel=1
_java=17
pkgdesc='Extendable continuous integration server (lts)'
arch=('any')
url='https://jenkins.io'
license=('MIT')
depends=("java-runtime=${_java}" 'ttf-dejavu' 'fontconfig')
makedepends=("java-environment=${_java}" 'git' 'maven')
provides=('jenkins-ci')
conflicts=('jenkins-ci')
replaces=('jenkins-ci')
backup=('etc/conf.d/jenkins')
install='jenkins.install'
noextract=("jenkins-${pkgver}.war")
source=("jenkins-${pkgver}.war::https://get.jenkins.io/war-stable/$pkgver/jenkins.war"
        # Rename to force re-download on new version
        'jenkins.conf'
        'jenkins.service'
        'jenkins.tmpfiles'
        'jenkins.sysusers'
        'LICENSE')
sha512sums=('ef3891eb0890ca02e9d216a7d172929480a16a07f9ad7a1370afcacd5e8e13beea0ce6b8e7be649fed739aad383cc2e1f64bc403bd169c218e1ab12d3a767d7e'
            '482b642988027b623995e0488cc00011be5bbe9890a6d40dd6979197fa50794889ff731f798891106b367962cf60cb59b0260caadfcee9685b358a966f759553'
            'c1e9a542bfd3db54ea0ef57acdac47ad5180330f9ffab44296762b0e69e75ce595d85a77d46025586fb507aedce4f1a032379dcd16b7b886fe475a99849fa4b2'
            'a845a7147be54affc586dfce9a188ec24c92e673e88dec0b62da386d2e597de6ecda103429008562abd897f179a52c37cf2188ebc65b8c636efd07d707e18f90'
            '896cbc64eadb2f3bb9fa7fc26dbfc527b1823d8bff3158be7f1936cc250f55eeafe89079e1ceb8f3d269041662573ccbbb36248140b4ba24144a564366f8847a'
            '0df6479a600db395c12ad29ebda3120d00460338b9a6b15913e2245aa29212a3798c32e664ca70c8034146e2e0b573066deec9e3210198202f753994e1b83efa')
build() {
  export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
}
check() {
  export PATH="/usr/lib/jvm/java-${_java}-openjdk/bin:${PATH}"
}

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "jenkins-${pkgver}.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -Dm644 jenkins.service "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -Dm644 jenkins.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/jenkins.conf"
  install -Dm644 jenkins.sysusers "$pkgdir/usr/lib/sysusers.d/jenkins.conf"
  install -Dm644 jenkins.conf "$pkgdir/etc/conf.d/jenkins"
}

