# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi-meet
_pkgname=turnserver
_version=1.0.7339
_url=https://download.jitsi.org/unstable/jitsi-meet-turnserver_1.0.7339-1_all.deb

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
optdepends=("coturn")
makedepends=(
)
options=('!strip')
backup=(
)
makedepends=('tar')
source=(
        "$_url"
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
        DOCDIR="${pkgdir}/usr/share/doc/${_pkgbase}"
	install -d "$DOCDIR"
	cp -R usr/share/jitsi-meet-turnserver/* "${DOCDIR}"
	# install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-turn/turnserver.conf doc/debian/jitsi-meet/jitsi-meet.conf doc/debian/jitsi-meet-turn/coturn-certbot-deploy.sh
        chown -R root:root "${pkgdir}"
}
sha256sums=('40a4178bb270c7243fb40f1e6cf8825f3981dfd0ff168e134cf318ecbe0534ad')
