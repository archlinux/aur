# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=slf4j
pkgver=1.7.32
pkgrel=1
pkgdesc="Simple Logging Facade for Java for various logging frameworks (e.g. java.util.logging, logback, log4j)"
arch=('any')
url="https://www.slf4j.org"
license=('MIT')
depends=('java-runtime')
optdepends=('log4j')
source=("https://raw.githubusercontent.com/qos-ch/slf4j/v_${pkgver}/LICENSE.txt"
        "https://repo1.maven.org/maven2/org/slf4j/jcl-over-slf4j/${pkgver}/jcl-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/jul-to-slf4j/${pkgver}/jul-to-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/${pkgver}/log4j-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${pkgver}/slf4j-api-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-ext/${pkgver}/slf4j-ext-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-jcl/${pkgver}/slf4j-jcl-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/${pkgver}/slf4j-jdk14-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/${pkgver}/slf4j-log4j12-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-migrator/${pkgver}/slf4j-migrator-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-nop/${pkgver}/slf4j-nop-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/${pkgver}/slf4j-simple-${pkgver}.jar"
        "setClasspath.sh"
        "migrator.desktop")
noextract=("jcl-over-slf4j-${pkgver}.jar"
           "jul-to-slf4j-${pkgver}.jar"
           "log4j-over-slf4j-${pkgver}.jar"
           "slf4j-api-${pkgver}.jar"
           "slf4j-ext-${pkgver}.jar"
           "slf4j-jcl-${pkgver}.jar"
           "slf4j-jdk14-${pkgver}.jar"
           "slf4j-log4j12-${pkgver}.jar"
           "slf4j-migrator-${pkgver}.jar"
           "slf4j-nop-${pkgver}.jar"
           "slf4j-simple-${pkgver}.jar")


package() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	install -D -m644 migrator.desktop ${pkgdir}/usr/share/applications/migrator.desktop
	install -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}
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

sha256sums=('899cb2e2f92e74ec969e477503c6442fb50bec5d523bc87dc40bad3419113c3b'
            '60f3bda5922e3912889cca1311d1b227753610bf60cb4e5e914e8b2eaa0326b4'
            '6dee8d85ad6943aff0600f14897c469e64bae0413ee33a15c448af00432c0642'
            'cef183e051664d53cc8f046fb616ed39eab9e61631e13299c939c995c11e57e3'
            '3624f8474c1af46d75f98bc097d7864a323c81b3808aa43689a6e1c601c027be'
            '1f252dd5c85d901186198ad3e89ab2996182b6cc3aaa17c08c2ab8dcbda46b54'
            '6341e0327931b879215dfd37f6928544b682c95599e8be95caf762b91ea4e725'
            '4e09fd5ace1d3e5d1c9571b8eb7b17a23149e5ac322c11314c688991e2eb6f0b'
            '93b09895667903d6154093b6ce10002529dfe01348e6050bf351e835fdd0f194'
            'b818b3af71960c96e6d176981ba1607fee82394d1f3023a0f599b2ca5e82ddcb'
            'f2d20b60b2b87fc1ca904e0cd4520deeeebf8a9c5b723ae2493cc4219389d782'
            'd2fdd7b73ca2019a2062d145a0d86179a58f98c8c3e35ca7c735a27b3b5621c3'
            '9a1efcd3b99c0ef88e1fbdf361a7832f09a925802a7518629f271ff8e08ae940'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
