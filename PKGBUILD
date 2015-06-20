# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=slf4j
pkgver=1.7.12
pkgrel=1
pkgdesc="A successor to the log4j project."
arch=('any')
url="http://www.slf4j.org"
license=('MIT')
depends=('java-environment-common')
optdepends=('log4j')
source=("${url}/dist/${pkgname}-${pkgver}.tar.gz"
        "setClasspath.sh"
        "migrator.desktop")

package() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	cd ${srcdir}

	install -D -m644 migrator.desktop ${pkgdir}/usr/share/applications/migrator.desktop
	install -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}
	cd ${pkgname}-${pkgver}
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

	# jars
	for i in jcl-over jul-to log4j-over; do
		install -m644 ${i}-${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in api ext jcl jdk14 log4j12 migrator nop simple; do
		install -m644 ${pkgname}-${i}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/}
	done
}
md5sums=('2de3e2276d2066f46d1d30c919e9fd95'
         '30637bebdbd56f4800072e2c931e13d1'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('ee93f7baa5d0e3db5fc130f5216750059992bfa0e5cb618a808428edf2fc28a1'
            '9a1efcd3b99c0ef88e1fbdf361a7832f09a925802a7518629f271ff8e08ae940'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
