# Maintainer: Katoga <katoga.cz@hotmail.com>
pkgname=omf2097-bin
pkgver=2.1
pkgrel=1
pkgdesc='Fighting game featuring Human Assisted Robots'
arch=('any')
url="http://www.omf2097.com/"
license=('custom')
depends=('dosbox')
makedepends=('unrar')
install="${pkgname}.install"
source=(
	'http://www.omf2097.com/pub/files/omf/omf2097.rar'
	"${pkgname}.desktop"
	"${pkgname}.png"
	"${pkgname}.sh"
	"${pkgname}.conf"
	"${pkgname}.install"
	'SCORES.DAT'
	'SETUP.CFG'
	'SETUP.INI'
	'SOUNDCRD.INF'
	'MDRV004R.MUS'
)
sha256sums=(
	'bc2ce50b8ea282b61e9685e883436e9cb4bcf7bacec0a58f0a685f20289f8a13'
	'588777aa553746c6f842fb2971f361505c3399d2e6ec227a045a5d449f405740'
	'1c6f8c4d72390b3e54d9d8ec4a33d0c3888a7e821e45da588a024c6bfe2575e9'
	'6a30c8e2cf321287ff140e0654d1a17479c7f9affb1b2ab68b403a21bfaba268'
	'85cb3505fd827ed0c731ef3efd193bb79f819b014ea82743ca3ca00a42dfd590'
	'2502046a14dcf0a016f51b4aedd0750ca2ee704416e36d9ce2e28ab2cffb1eb7'
	'155e437b946ac82ae591ff382b8d19efda9397b2282672dbabd91ec31ce8a651'
	'd759d16ae12dc66911eeb96b6956eb862e3514e193a902fb327b0d03f743a1f9'
	'a5724e3e3185accb9c7f35dd93396e565dff83c7d261453d10e3c55bb5c6ae8a'
	'942022a88e01c82f5f2159f7847d3da4e033c64a062436188c5b0642c411cea5'
	'9a12a02da8de5d44a380f0b447007203f579bc2feac7fb79508fb259a6ec2e4b'
)
noextract=(
	omf2097.rar
)

prepare() {
	unrar x -idq -y omf2097.rar
}

package() {
	mkdir -m 0775 -p ${pkgdir}/opt/${pkgname}/OMF2097
	chown :games ${pkgdir}/opt/${pkgname}/OMF2097
	chmod g+s ${pkgdir}/opt/${pkgname}/OMF2097

	install -m 0664 -g games ${srcdir}/OMF2097/* ${pkgdir}/opt/${pkgname}/OMF2097/
	install -m 0644 -g games ${srcdir}/${pkgname}.png ${pkgdir}/opt/${pkgname}/${pkgname}.png
	install -m 0644 -g games ${srcdir}/${pkgname}.conf ${pkgdir}/opt/${pkgname}/${pkgname}.conf

	for F in 	'SCORES.DAT' 'SETUP.CFG' 'SETUP.INI' 'SOUNDCRD.INF' 'MDRV004R.MUS'; do
		install -m 0664 -g games ${srcdir}/${F} ${pkgdir}/opt/${pkgname}/OMF2097/${F}
	done

	mkdir -p ${pkgdir}/usr/share/applications
	install -m 0644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

	mkdir -p ${pkgdir}/usr/bin
	install -m 0755 -D ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	install -m 0644 -D ${srcdir}/OMF2097/LICENSE.DOC ${pkgdir}/usr/share/licenses/${pkgname}/EULA
}

