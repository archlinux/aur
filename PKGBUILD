pkgname=emercoin-bin
_pkgname=emercoin
_githuborg=emercoin
pkgver=0.8.3
pkgrel=1
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('x86_64')
depends=("libevent>=2.1.8" "qt5-base" "dbus>=1.10.14" "miniupnpc>=2.0.20170509" "expat>=2.2.0" "freetype2>=2.7.1" "protobuf")
provides=('emercoin')
conflicts=('emercoin')
url="http://emercoin.com/"
license=('GPL3')
install='emercoin.install'
_archive="emercoin-${pkgver}-x86_64-linux-gnu"
source_x86_64=("https://github.com/emercoin/emercoin/releases/download/v${pkgver}emc/${_archive}.tar.xz"
"emercoin.install"
"emercoind.service"
"emc48.png"
"com.emercoin.Emercoin.desktop")
sha256sums_x86_64=('def1278a4fddbc6960f3cc4cf5757b72b6c269a99afaa6e0a4ac1317f0055cf9'
                   '9d430f8bc61ce2f7c4e1f4b297065b5b6adad92d7dd4088e9a3bb7ba7751feff'
                   '9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
                   '99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
                   'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')

package() {
  _pkgdir="${pkgdir}"
  _systemddir="usr/lib/systemd/system"
  _package
}

_package() {
    install -Dm644 ${srcdir}/emercoind.service ${_pkgdir}/usr/lib/systemd/system/emercoind.service
    install -Dm644 "${srcdir}"/com.emercoin.Emercoin.desktop ${_pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
    install -Dm644 "${srcdir}"/emc48.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
		install -Dm755 ${_archive}/emercoind ${_pkgdir}/usr/bin/emercoind
		install -Dm755 ${_archive}/emercoin-qt ${_pkgdir}/usr/bin/emercoin-qt
		install -Dm755 ${_archive}/emercoin-cli ${_pkgdir}/usr/bin/emercoin-cli
    chmod +x ${_pkgdir}/usr/bin/*
}
