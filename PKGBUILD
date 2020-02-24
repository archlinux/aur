# Maintainer: Yoan Blanc <yoan@dosimple.ch>
pkgname=getax
pkgver=2019
_update=1.02
pkgrel=3
pkgdesc="Application for the tax reporting of physical people in the canton of Geneva, Switzerland."
url="http://www.getax.ch/support/"
depends=(
	'gnome-vfs'
	'java-runtime=8'
	'webkitgtk2'
)
arch=(x86_64)
license=('unknown')
_base="https://www.getax.ch/getaxpp"
source=(
	"$pkgname-$pkgver-$_update.tar.gz::$_base/$pkgver/$pkgname$pkgver.tar.gz"
	"getax"
	"config|cd|resources|immeublesValeurLocative.txt::$_base/maj19/1.01/config/cd/resources/immeublesValeurLocative.txt"
	"config|cd|shortHelp|fr|a--31.71-01::$_base/maj19/1.01/config/cd/shortHelp/fr/a--31.71-01"
	"config|cd|shortHelp|fr|b4--32.30-01::$_base/maj19/1.01/config/cd/shortHelp/fr/b4--32.30-01"
	"config|cd|shortHelp|fr|d--15.10-13::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.10-13"
	"config|cd|shortHelp|fr|d--15.10-15::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.10-15"
	"config|cd|shortHelp|fr|d--15.10-18::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.10-18"
	"config|cd|shortHelp|fr|d--15.10-19::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.10-19"
	"config|cd|shortHelp|fr|d--15.40-11::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.40-11"
	"config|cd|shortHelp|fr|d--15.40-13::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.40-13"
	"config|cd|shortHelp|fr|d--15.40-16::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.40-16"
	"config|cd|shortHelp|fr|d--15.40-17::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.40-17"
	"config|cd|shortHelp|fr|d--15.xx-61::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-61"
	"config|cd|shortHelp|fr|d--15.xx-62::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-62"
	"config|cd|shortHelp|fr|d--15.xx-63::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-63"
	"config|cd|shortHelp|fr|d--15.xx-64::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-64"
	"config|cd|shortHelp|fr|d--15.xx-65::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-65"
	"config|cd|shortHelp|fr|d--15.xx-66::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-66"
	"config|cd|shortHelp|fr|d--15.xx-67::$_base/maj19/1.01/config/cd/shortHelp/fr/d--15.xx-67"
	"config|cd|shortHelp|fr|d--58.10::$_base/maj19/1.01/config/cd/shortHelp/fr/d--58.10"
	"config|cd|shortHelp|fr|g--1::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1"
	"config|cd|shortHelp|fr|g--1-01::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1-01"
	"config|cd|shortHelp|fr|g--1-06::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1-06"
	"config|cd|shortHelp|fr|g--1-07::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1-07"
	"config|cd|shortHelp|fr|g--1-11::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1-11"
	"config|cd|shortHelp|fr|g--1-12::$_base/maj19/1.01/config/cd/shortHelp/fr/g--1-12"
	"config|cd|shortHelp|fr|pg1--1-10::$_base/maj19/1.01/config/cd/shortHelp/fr/pg1--1-10"
	"config|cd|shortHelp|fr|pg3--61.25-01::$_base/maj19/1.01/config/cd/shortHelp/fr/pg3--61.25-01"
	"model|model_pp_cd.xml::$_base/maj19/1.01/model/model_pp_cd.xml"
	"config|cd|info|fr|about.html::$_base/maj19/1.02/config/cd/info/fr/about.html"
	"config|cd|info|fr|welcome.html::$_base/maj19/1.02/config/cd/info/fr/welcome.html"
	"config|cd|mainHelp|fr|_changelog.html::$_base/maj19/1.02/config/cd/mainHelp/fr/_changelog.html"
	"config|cd|shortHelp|helpMapping.properties::$_base/maj19/1.02/config/cd/shortHelp/helpMapping.properties"
	"lib|getax-pp-cd.jar::$_base/maj19/1.02/lib/getax-pp-cd.jar"
	"lib|getax-pp-generated.jar::$_base/maj19/1.02/lib/getax-pp-generated.jar"
	"lib|getax-pp-shared.jar::$_base/maj19/1.02/lib/getax-pp-shared.jar"
	"$_base/maj19/1.02/version_linux.xml"
)
_dirname="getax-pp-$pkgver"

prepare() {
	# Skip provided Java
	rm -rf $_dirname/jre

	# Remplaces the downloaded files from 1.01 and 1.02
	for f in config\|* lib\|* model\|*; do
		mv $f "$_dirname/$(echo $f | tr "|" "/")"
	done

	mv version_linux.xml "$_dirname"/version.xml
}
package() {
	cd "$_dirname"

	_app_home=/usr/share/${pkgname}

	install -d "${pkgdir}"{${_app_home}/bin,/usr/bin}

	cp -r config lib model "${pkgdir}${_app_home}"
	install -D -m644 version.xml "${pkgdir}${_app_home}/version.xml"

	install -m755 "${srcdir}"/${pkgname} "${pkgdir}"${_app_home}/bin/${pkgname}
	ln -s ${_app_home}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
sha256sums=(
	'6d8dde319c28f06b4a725df87aa0ed806ed9fd40adb9cbea34a41ab93c852967'
	'a474ed38201b0abc1459ff0ffa37a1fb0e947a135a18e08cb00acadad23488be'
	'64aea84936e7c2214e69b7196a618cb0e6cb8ff9ef12d2279abc564e7788b769'
	'120f921224a5eb86feb214df341346ae4d1bdb499a3d6495ad7a6bfcf21d7e52'
	'1b5959b0e0f3d8b73a55c174c8d00e696cb6149933b9b0c850cf7997c7a6f576'
	'17b40159d5f72137ddbef01c0c23c914e539f63ada1ced5f1a552e2d89e10e84'
	'a45648151de6fe8b98a3bd21af00109131fe1e3fef5c22ec8d6dcb68f9563bec'
	'bba21370c141753077f3146384e522ca2729bda94938aa1ae3955a8e49b97407'
	'9fc00c03ea1670d281b4fb1528a6388553cd0c071c062c9e88c4e2f8c355af12'
	'c953f02c764cd11c02c50b29ad0d313f4e6a53058a7a3c367c2ddacbb7ae4752'
	'0d25259d89d34c548c823ef24134bb3cbbcd312815e881ec7ea515ee3b678afd'
	'244c0be6bf0520faed4484ca7dcf192c36c8f78f611ba7995028665779a339a2'
	'c563b89edeeae1d9ec36bde3e6ba53745d7a2e279b52cbbb3d320882b9643079'
	'521da0dedf3e063dec8bb8957c4dd3df18306e70398bd07b3152a42429c6eaa2'
	'1a7fa2afdc5d45250162435f1db0665f51b304b7f5e53d554ecf51035c68f2c9'
	'cb0405d3e4cefcda71fc2b2a1ed84d504073d595da423d7d8c615c59a2cb6f61'
	'1a5b7119f2cf7ba7db8c5afaf7c8e31eb271872bdc62616bd34c84970fcc0b06'
	'f28ee06f4878a884c15846c88e7cdb61c1ef67ebb3f2037a12d28f14066cf43b'
	'd0a497f4b12b62596a239dcfa663578d54bf2905bd574d3a5cd0b54884512989'
	'4cb48b1e64093c81a1b892f9eff9fc37c1b33ff5ebb225b22c4c369c6aba25e2'
	'b1ad49f96613454d9f2c05066cdcdf8efa4d2b5058b678346e0624f87d14e94f'
	'38ec4b2fadc7007c23b339b832409cbc2bf59e7b4bc753133fa116e794d44520'
	'651fee162a9464cc7386f54b192d53f66739d6aef255c0eb1584a6dcae70d00c'
	'6ba99ab879a887b28d4a6e1e371bc02ad9c4091060b1ba9026bca26c093e8f6e'
	'c9713ab752258a456142e2ef40d9b1ba4c8da8c0339b41e92b8667069b6969a7'
	'6a8f0586c666121cee535a53a2ff1f5b5924c11b4aedbb089519538d249dd877'
	'57b3884318cdb17b8dd0684052c5e30c66b1199d3e1701559ca2f45c2d2a0173'
	'2b024fcb6edf7ac7acff17d84de88735e2f08515cf1cf021eeb14bd4724133eb'
	'f23423858f3fb4c39ce43c25af5521649c36e673f2ee2c45e27a1f8c43299797'
	'9f60550eebfecbeee5fc3f9e7da06afcee6b9a526c634198c2b7ab1c4a4b2726'
	'cdca2dc7cbe73aee7b3f53b222b4aa24fcfc355b45a1a5f414a21c994c43bb1c'
	'97c932cd45ed396dec9ea8323ac5bc491a8ee2b8bc53b3133b30f07316d57977'
	'136e9743a2b4845ab3e1a446bf1b5dc551c1f0e7c4e68d8c423a9e7394e16da5'
	'1d61b1a54b3e94d337b9186e077bf83badeb2a88d52732c2b9a06832001b1a16'
	'17008be4c240c5a96beb6b5a905a35c5ddaa5e9d887a999bda1769d0037f389c'
	'36d38edab84da4f401b2dabd68e3079260c40bcb0d1614f6ecb3e404ea95918b'
	'be3aa6b30c030e161e2f3972cb6fd4ea1dc58e6882b1acbb7c5b67c9bfbfbcce'
	'980834fc9a58a2d00468560d1bb88bc72af6e50cfc9ee2f9e16e68813d18823b'
)
