# Maintainer: Clem Lorteau <spam at lorteau dot fr>
pkgname=polycule-bin
_origpkgname=polycule
_appid=business.braid.polycule
pkgver=0.3.4
pkgrel=1
pkgdesc="A geeky and efficient [matrix] client for power users."
arch=("x86_64")
url="https://polycule.im"
license=('EUPL-1.2')
groups=()
depends=(
	"dbus"
	"gtk3"
	"jsoncpp"
	"libnotify"
	"libsecret"
	"mimalloc"
	"mpv"
	"openssl"
	"xdg-user-dirs"
)
provides=("polycule=${pkgver}")
conflicts=("polycule")
source=(
	"https://gitlab.com/polycule_client/polycule/-/jobs/artifacts/v0.3.4/download?job=build%3Alinux%3Ax86_64"
	"https://gitlab.com/polycule_client/polycule/-/archive/v0.3.4/polycule-v0.3.4.tar.gz"
	)
sha256sums=(
	"b5f587e6253872abb3b95e34304af085591dc889b37ac41a74ebd187049490af"
	"cd452a14ef7843aaba8e80d627bfdcdd120ab1396ece7dbb9f895da3ed754dd5"
	)

package() {
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/linux/${_appid}.desktop" "${pkgdir}/usr/share/applications/${_appid}.desktop"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/linux/${_appid}-daemon.desktop" "${pkgdir}/etc/xdg/autostart/${_appid}-daemon.desktop"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/linux/${_appid}.service" "${pkgdir}/usr/share/dbus-1/services/${_appid}.service"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/linux/${_appid}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_origpkgname}/COPYING"
	ln -s "/usr/lib/polycule/data/flutter_assets/NOTICES.Z" "${pkgdir}/usr/share/licenses/${_origpkgname}/NOTICES.Z"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/pixmaps/${_appid}.svg"
	install -Dm 644 "${srcdir}/${_origpkgname}-v${pkgver}/assets/logo/logo-circle.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"

	cd "$_origpkgname-v$pkgver-amd64"
	mkdir -p $pkgdir/opt/$_origpkgname
	install -Dm755 $_origpkgname $pkgdir/opt/$_origpkgname/
	cp -r lib $pkgdir/opt/$_origpkgname/
	cp -r data $pkgdir/opt/$_origpkgname/
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$_origpkgname/$_origpkgname $pkgdir/usr/bin/$_origpkgname
}
