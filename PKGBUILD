# Maintainer: C0rn3j <spleefer90@gmail.com>
# Contributor: Celogeek <private-4zokpdq6@mrhyde.xyz>

_basename=jitsi-meet
_pkgname=turnserver
_tag=1.0.4628
_version=1.0.4628

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
optdepends=("coturn")
makedepends=(
)
options=('!strip')
backup=(
)
makedepends=('tar')
source=(
        "https://download.jitsi.org/stable/${_debname}_${_tag}-1_all.deb"
	"jitsi.install"
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
        DOCDIR="${pkgdir}/usr/share/doc/${_pkgbase}"
	install -d "$DOCDIR"
	cp -R usr/share/jitsi-meet-turnserver/* "${DOCDIR}"
	# install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-turn/turnserver.conf doc/debian/jitsi-meet/jitsi-meet.conf doc/debian/jitsi-meet-turn/coturn-certbot-deploy.sh
        chown -R root:root "${pkgdir}"
}
sha256sums=('66f0cfe4b99fa36883ff54fddd83e26376cc14334240d3c270d9d23793977c73'
            '81c41a7ff0339922b6dc1544a3091f15b0cc71b4ad9806a20aea1a0eb3300bad')
