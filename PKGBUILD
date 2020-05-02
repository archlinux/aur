# Maintainer: Martin Rys <rys.pw/#contact_me>

pkgname=jitsi-videobridge
pkgver=2.1_197_g38256192
_tag="jitsi-meet_4548"
pkgrel=1
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
        config
        service
        sip-communicator.properties)
noextract=()
sha256sums=('6503869e1b7d4180316a0af29c66fae3e4ed1061d7bd6def053902bcc47194d0'
            'd2746be91f361557343398b9544233f1482d60c6117db4ecaa7c7851cd347b50'
            '4d68d857e76e38c9379573143a60eab681b721543f8515edad95530f95d4384a'
            '2b7679218752c0435a1496306b447d72aafaf5b671b6eef63e58c83a67638ced')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-stable-${_tag}"
    mvn package -DskipTests -Dassembly.skipAssembly=false
    unzip -o target/jitsi-videobridge-2.1-SNAPSHOT-archive.zip
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${pkgname}-stable-${_tag}/jitsi-videobridge-2.1-SNAPSHOT/" "${pkgdir}/opt/jitsi-videobridge"
    install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/jitsi-videobridge.service
    install -Dm644 config "${pkgdir}"/etc/jitsi/videobridge/jitsi-videobridge.conf
    install -Dm644 sip-communicator.properties "${pkgdir}"/etc/jitsi/videobridge/sip-communicator.properties
}
