# Maintainer: C0rn3j <spleefer90@gmail.com>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi-meet
_pkgname=prosody
_version=1.0.7531
_url=https://download.jitsi.org/stable/jitsi-meet-prosody_1.0.7531-1_all.deb

_pkgbase=${_basename}-${_pkgname}
_debname=${_basename}-${_pkgname}
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins binary"
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
        "$_url"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})
install=jitsi.install

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
sha256sums=('a69463521c7f54191b14d850ba76947ce9f07243aa2514144d53212986744ad5')
