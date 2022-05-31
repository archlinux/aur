# Maintainer: Alex S. <shantanne[at]hotmail.com>

pkgname=ordersprinter
pkgver=2.3.10
pkgrel=1
packagename="$(echo ${pkgname}-${pkgver} | sed 's/\./_/g')"
pkgdesc="OrderSprinter is a free Point-Of-Service/Point-Of-Sale software (POS) for the gastronomy."
url=https://ordersprinter.de/
arch=('any')
license=('Creative Commons License BY-NC-ND')
depends=('mysql' 'php' 'php-gd' 'jre-openjdk-headless')

source=("https://ordersprinter.de/${packagename}.zip"
        ${pkgname}.conf
        ${pkgname}.service
        ${pkgname}.sysusers
        ${pkgname})
md5sums=('38611ab548de026f851033ad34b7cb8ac5ab6d27'
         '7b2c461db174827432b446b142226c781b93fa1b'
         '9a123793639747bad7095f2fce7e4dcb413daeca'
         '435225254d009b030ec3ef6a2d5d1018d406609e'
         'beaf9cac96db3eeea8385d412cbf8204e5eea37e')
install=${pkgname}.install

package()
{
	mkdir -p ${pkgdir}/opt/${pkgname}
	mkdir -p ${pkgdir}/etc/${pkgname}
	mkdir -p ${pkgdir}/usr/lib/systemd/system
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/{${pkgname},swissbit}
	cp -r ${srcdir}/{gastsystem,printserver,scripts,spider,tseconnector,webapp} ${pkgdir}/opt/${pkgname}/
	install -Dm 644 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/${pkgname}/${pkgname}.conf
	install -Dm 644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
	install -Dm 644 ${srcdir}/${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
	install -Dm 644 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	# move to proper licenses directories
	install -Dm 644 ${srcdir}/webapp/OrderSprinter-LIZENZ.html ${pkgdir}/usr/share/licenses/${pkgname}/
	install -Dm 644 ${srcdir}/tseconnector/swissbit/tseconnector_lib/{LICENSE-apache-commons.txt,LICENSE-jackson-jr.html,LICENSE-json-simple.txt,LICENSE_Swissbit_Wormapi.pdf} ${pkgdir}/usr/share/licenses/swissbit/
}
