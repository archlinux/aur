# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
pkgname=linuxqq-firejail
_pkgname=linuxqq
pkgver=0.0.1
pkgrel=1
pkgdesc='New Linux QQ based on Electron, running in Firejail (security sandbox)'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-new-firejail"
license=('unknown')
# TODO: add linuxqq
depends=('firejail')
source=("tencent-qq.profile")
sha512sums=('8c6a8075a74c8ffaac4ee2f96c6e41d51de1a040d81f5e3d55543d614f5e60d76ec1d42d935d37cd7031999eadfe4d5597277d35f5ed20b87c781e7eb836edb4')

package() {
	# Patch Firejail
	echo "  -> Patching Firejail..."
	mkdir "${pkgdir}/etc/firejail" -p
	mv "tencent-qq.profile" "${pkgdir}/etc/firejail/"

	# Wrap launcher
	echo "  -> Wrapping launcher..."
	mkdir "${pkgdir}/usr/share/applications" -p
	cp "/usr/share/applications/qq.desktop" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "2s!Name=QQ!Name=QQ in Firejail!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "3s!/usr/bin/${_pkgname}!firejail --profile=/etc/firejail/tencent-qq.profile /usr/bin/${_pkgname}!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
}
