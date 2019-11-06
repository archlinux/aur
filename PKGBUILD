# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=slf4j
pkgver=1.7.29
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
            'd7949af5620aff966e8ee2d72c0a59c972bd069940e0b4cadef5e3b2217b9120'
            'ac6f86a0afe572c505c88bfd8a79e86b3508926d8cca14533fbda8cb83634a26'
            '9c6500852b976f05eeb5a0167d539c8f8a61ae571c04227a92351df5a36cd1c0'
            '47b624903c712f9118330ad2fb91d0780f7f666c3f22919d0fc14522c5cad9ea'
            '7f31d275d08f5829604643922089bef6d8d3156d866013a54f95fc5a8746d157'
            '952d59bd55fed0659a7776131bf54be9ed7d1d652eaac681acedd47429e5fd31'
            'dedf1ea6e2e6f75af514a6de4a5c6484829ae944df1919c1d788c6741c182d18'
            'add7e4f6084ba3a335c46725e9cb27098d2c3be606a1a0f9996f392b8f6de035'
            'def9c93e01756c76f4c9280082c55100da7c06b1025d0cfdcd67eff29b1609bf'
            '3693a7782b918eaa0c99ed3d9eac4dbf0b91af634eb8a9a16f963a079d8d8fba'
            '180c4715e1708c5415db03da3154a3f5e1ad6b9422893e5d227138800b4b0a74'
            '9a1efcd3b99c0ef88e1fbdf361a7832f09a925802a7518629f271ff8e08ae940'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
