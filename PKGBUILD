# Maintainer sakura1943 <1436700265@qq.com>
pkgname='windterm-bin'
_pkgname='WindTerm'
pkgver='2.5.0'
_pkgver='2.5.0'
_author='kingToolbox'
pkgrel=1
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=()
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=('windterm')
source=("${pkgname}-${pkgver}-${arch}.tar.gz::https://github.com/${_author}/${_pkgname}/releases/download/${_pkgver}/${_pkgname}_${pkgver}_Linux_Portable_${arch}.tar.gz"
	"windterm.png::https://raw.githubusercontent.com/${_author}/${_pkgname}/master/images/${_pkgname}_icon_1024x1024.png"
	"windterm"
	"windterm.desktop")
sha512sums=('9d263aac0059127eaf0b497f5345638a5590d8b296392aebe92a9ab351f7793986e24114d217a45baa8f1796f58979343b3ad995974d538ee2b31ae087df037a'
	"bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e"
	"ef48e2a9c62af858cf172f4b2beb56ad495e1a5f1fdb0ee479cf28759ac63e6a1ef53a56fd85723e03f33bf2af9891f25a9d33b07f8fe8840394faf15a9562ef"
	"4a31f874965ac5017fb38602d035edf06f030ca3d731dcfd92ba0fe073ccdc973fc2b0989701c3a275e2a528bec42cb111bdb8178ea313207200bc53a469e66d")
_install() {
find $2 -type f -exec install -Dm$1 {} $3/{} \;
}

package() {
	install -d "${pkgdir}"/usr/share/icons
	install -d "${pkgdir}"/usr/share/applications
	install -d "${pkgdir}"/usr/bin
	cd ${srcdir}
	_install 755 ${_pkgname}_${pkgver} ${pkgdir}/opt
	mv -f ${pkgdir}/opt/${_pkgname}_${pkgver} ${pkgdir}/opt/${_pkgname}
	chmod 777 ${pkgdir}/opt/${_pkgname}
	cd ${pkgdir}/opt
	find ${_pkgname} -type d -exec chmod 0777 {} \;
	install -Dm755 ${srcdir}/windterm.png "${pkgdir}"/usr/share/icons
	install -Dm755 ${srcdir}/windterm "${pkgdir}"/usr/bin
	install -Dm755 ${srcdir}/windterm.desktop "${pkgdir}"/usr/share/applications
}

