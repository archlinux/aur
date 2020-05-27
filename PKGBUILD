# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=jitsi-videobridge
# https://github.com/jitsi/jitsi-videobridge/releases/latest
pkgver=2.1_202_g5f9377b9
_tag="jitsi-meet_4627"
pkgrel=3
epoch=
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
groups=()
depends=("java-runtime-headless")
makedepends=("unzip" "maven")
checkdepends=()
optdepends=()
provides=(jitsi-videobridge)
conflicts=(jitsi-videobridge-git)
replaces=()
backup=("etc/jitsi/videobridge/jitsi-videobridge.conf"
        "etc/jitsi/videobridge/sip-communicator.properties")
options=()
install=
changelog=
source=(${pkgname}-${pkgver}-${_tag}.tar.gz::https://github.com/jitsi/jitsi-videobridge/archive/stable/${_tag}.tar.gz
        jitsi-videobridge.conf
        jitsi-videobridge.service
        sip-communicator.properties
        sysusers.conf
        tmpfiles.conf)
noextract=()
sha256sums=('a9f57668426341ddc74518e0442b8514841898bef45e1f22c9252ac593d567a0'
            'd2746be91f361557343398b9544233f1482d60c6117db4ecaa7c7851cd347b50'
            '0b3a992ae295d1c691313a10731330cc38ae9e03989fe2afc1e12fcfc7dc4539'
            '2b7679218752c0435a1496306b447d72aafaf5b671b6eef63e58c83a67638ced'
            '998cbc64def56ab98080ff7150dd0913a5e10325cd2b038cf3db14baf8cb19fc'
            '36548f4980dcdbb27e0738c3fd928005d49a7b5c2c65d7a583ebb445626074dd')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-stable-${_tag}"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jitsi-videobridge-2.1-SNAPSHOT-archive.zip
}

package() {
    install -d "${pkgdir}/usr/share"
    cp -R "${srcdir}/${pkgname}-stable-${_tag}/jitsi-videobridge-2.1-SNAPSHOT/" "${pkgdir}/usr/share/jitsi-videobridge"
    install -Dm644 jitsi-videobridge.service "${pkgdir}/usr/lib/systemd/system/jitsi-videobridge.service"
    install -Dm644 jitsi-videobridge.conf "${pkgdir}/etc/jitsi/videobridge/jitsi-videobridge.conf"
    install -Dm644 sip-communicator.properties "${pkgdir}/etc/jitsi/videobridge/sip-communicator.properties"
    install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/jitsi-videobridge.conf"
    install -Dm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/jitsi-videobridge.conf"
}
