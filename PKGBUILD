# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi-meet
_pkgname=prosody
_tag=4321
_version=1.0.4321

_pkgbase=${_basename}-${_pkgname}-nightly
_debname=${_basename}-${_pkgname}
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins nightly binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("prosody" "lua52" "lua52-sec" "lua52-zip" "lua52-event")
makedepends=('tar')
options=('!strip')
backup=(
)
source=(
        "https://download.jitsi.org/unstable/${_debname}_1.0.${_tag}-1_all.deb"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
}

package() {
        cd "$srcdir/${_pkgbase}"

        DESTDIR="${pkgdir}/usr/lib/${_pkgbase}"
        DOCDIR="${pkgdir}/usr/share/doc/${_pkgbase}"
        install -d "$DESTDIR"
	install -d "$DOCDIR"
	cp -R usr/share/jitsi-meet/prosody-plugins/* "${DESTDIR}"
	cp -R usr/share/jitsi-meet-prosody/* "${DOCDIR}"

        sed -i 's@/usr/share/jitsi-meet/prosody-plugins/@/usr/lib/'${_pkgbase}'@' "${pkgdir}/usr/share/doc/${_pkgbase}/prosody.cfg.lua-jvb.example"

        chown -R root:root "${pkgdir}"
	

}
sha256sums=('ec21ee3a0287491d57733b0d27e59054f915b8134a4a80805fbe5064d178e1b4')
