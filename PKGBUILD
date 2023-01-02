# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
# Contributor: glitsj16
pkgname=linuxqq-firejail
pkgver=0.0.1
pkgrel=3
pkgdesc='Run QQ in Firejail (security sandbox). Install linuxqq before this.'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-firejail"
license=('unknown')
# TODO: add linuxqq
depends=('firejail')
profile="linuxqq.profile"
source=("${profile}")
sha512sums=('a4ee0f052e34868363067afd7a0964a1e3b8967c153fac0a52b0669e2f1ab84c0a1a2709f855c42fb3bb5271c3c909d7bdae285772e3b599cb3a77f6b298d376')

package() {
	# Patch Firejail
	echo "  -> Patching Firejail..."
	mkdir "${pkgdir}/etc/firejail" -p
	mv "${profile}" "${pkgdir}/etc/firejail/"

	# Wrap launcher
	echo "  -> Wrapping launcher..."
	mkdir "${pkgdir}/usr/share/applications" -p
	cp "/usr/share/applications/qq.desktop" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "2s!QQ!QQ in Firejail!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "3s!/usr/bin/linuxqq!firejail --profile=/etc/firejail/${profile} /usr/bin/linuxqq!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
}
