# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=slf4j
pkgver=2.0.16
pkgrel=1
pkgdesc="Simple Logging Facade for Java for various logging frameworks (e.g. java.util.logging, logback, log4j)"
arch=('any')
url="https://www.slf4j.org"
license=('MIT')
depends=('java-runtime')
source=("https://raw.githubusercontent.com/qos-ch/slf4j/master/LICENSE.txt"
        "https://repo1.maven.org/maven2/org/slf4j/jcl-over-slf4j/${pkgver}/jcl-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/jul-to-slf4j/${pkgver}/jul-to-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/${pkgver}/log4j-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/osgi-over-slf4j/${pkgver}/osgi-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${pkgver}/slf4j-api-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-ext/${pkgver}/slf4j-ext-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk-platform-logging/${pkgver}/slf4j-jdk-platform-logging-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-jdk14/${pkgver}/slf4j-jdk14-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-reload4j/${pkgver}/slf4j-reload4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-migrator/${pkgver}/slf4j-migrator-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-nop/${pkgver}/slf4j-nop-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/${pkgver}/slf4j-simple-${pkgver}.jar"
        "setClasspath.sh"
        "migrator.desktop")
noextract=("jcl-over-slf4j-${pkgver}.jar"
           "jul-to-slf4j-${pkgver}.jar"
           "log4j-over-slf4j-${pkgver}.jar"
           "osgi-over-slf4j-${pkgver}.jar"
           "slf4j-api-${pkgver}.jar"
           "slf4j-ext-${pkgver}.jar"
           "slf4j-jdk-platform-logging-${pkgver}.jar"
           "slf4j-jdk14-${pkgver}.jar"
           "slf4j-reload4j-${pkgver}.jar"
           "slf4j-migrator-${pkgver}.jar"
           "slf4j-nop-${pkgver}.jar"
           "slf4j-simple-${pkgver}.jar")


package() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	install -D -m644 migrator.desktop ${pkgdir}/usr/share/applications/migrator.desktop
	install -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname}
	install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

	# jars
	for i in jcl-over jul-to log4j-over osgi-over; do
		install -m644 ${i}-${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in api ext jdk-platform-logging jdk14 reload4j migrator nop simple; do
		install -m644 ${pkgname}-${i}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/}
	done
}

sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            '5744d62c5af556e839ab922c9fa3f737f0a5971e478ba68b2eb5256b2842ec78'
            '0f2ec396ea29c9a440890d1f09fdb82fdd574b47b298435764235451c193861d'
            '0a4c4314b80d7b0ec733efb3cfbeb9005e7488e64132716396e33ef0ca1ac52d'
            'a49a983dd004e6a1f5417b970973616bd01810fd40b8fb93c42f422ae5d45b1c'
            'a12578dde1ba00bd9b816d388a0b879928d00bab3c83c240f7013bf4196c579a'
            '64527060fc741829277e24ff410a23923cf040a47b0045adb63df565d2cf5bbf'
            'bb82348666a695258d6a7aa47f164704355f3452a4266cefdd006ecaadfaaa45'
            '0fcf97cf6dd1f5768cfd57ed5d742fe7114b55a4948dab0d76271a30af859057'
            '803b894ee3a60e516c4de3f747c130639a05a25bcaf0aa00baab1c45e0e8bd57'
            'ed6243c03ae5bb71ec5654e4d7b2bc9c45c4b729807300063611d8caf95b5739'
            'deca6c04ed35515a0a911fa44c0e836bee92c0c59d2e8fa9bab8ffbc464a9ba7'
            'effc32018658bea09d1e08c7d1060ccad46c086960f583d07dd7ffe9c1172a47'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
