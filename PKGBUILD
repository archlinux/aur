# Maintainer wang <sk8_yy@outlook.com>
# Maintainer sakura1943 <1436700265@qq.com>
pkgname='windterm-bin-Prerelease'
_pkgname='WindTerm'
pkgver='2.6.0'
_pkgver='2.6-prerelease'
_pkgper='7'
_author='kingToolbox'
pkgrel=2
pkgdesc='A Quicker and better SSH/Telnet/Serial/Shell/Sftp client for DevOps.'
arch=('x86_64')
depends=()
conflicts=(windterm-bin)
license=('Apache-2.0')
url='https://github.com/kingToolbox/WindTerm/'
provides=('windterm')
source=("${pkgname}-${_pkgper}-${pkgver}-${arch}.tar.gz::https://github.com/${_author}/${_pkgname}/releases/download/${_pkgver}/${_pkgname}_${pkgver}_Prerelease_${_pkgper}_Linux_Portable_${arch}.tar.gz"
	"windterm.png::https://raw.githubusercontent.com/${_author}/${_pkgname}/master/images/${_pkgname}_icon_1024x1024.png"
	"windterm"
	"windterm.desktop")
sha512sums=('adbd6cccac7c99b99371060f16d7d300b7da140933702bcc9c6569cab39d43d33f350a6c6e4b1cbc3d8012c2d01df076e622fa1716a1f0afa1ad742a94d1e62f'
	"bfdcb9064eca32b06e6c493a48e8b38240cf9133a2d14a8ab45a4c0280bcfbef45f671dc1b86b64d7e6429cfaa6a95a9db7bb8c9c605b3b9aa852998a5abc17e"
	"ef48e2a9c62af858cf172f4b2beb56ad495e1a5f1fdb0ee479cf28759ac63e6a1ef53a56fd85723e03f33bf2af9891f25a9d33b07f8fe8840394faf15a9562ef"
    "af804a688ed45953ce089425981cce70c131481c44db78eb11bd8b105a122ff39621bf0d642f45278e02083600dfe51f30206e934e1805fe6d52c6d046c140e6")
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

