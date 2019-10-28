# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=slf4j
pkgver=1.7.28
pkgrel=3
pkgdesc="Simple Logging Facade for Java for various logging frameworks (e.g. java.util.logging, logback, log4j)"
arch=('any')
url="https://www.slf4j.org"
license=('MIT')
depends=('java-runtime')
optdepends=('log4j')
source=("https://github.com/qos-ch/slf4j/blob/v_${pkgver}/LICENSE.txt"
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

sha256sums=('7bba75924c26de6c3941ce5c4ce0785cdb3854bf715d2123b25086cf6d0f2114'
            'b81f5f910da9708c7a6a77b720a7de20154cced4065b56f33301945c04aaad70'
            '67c99ffdef691c3b0f817e130c2047fa43ecf12017613ff597f66f768d745475'
            'c24e45c905f0c3b1dcc873164f5409bbfe3ee8860e366d1cd2190f798227f864'
            'fb6e4f67a2a4689e3e713584db17a5d1090c1ebe6eec30e9e0349a6ee118141e'
            'a5ea85ee27d0c2a1bae03c7c298770896d0aa52e0a9297a1cf45b0e3e65363cf'
            'b10201fef9dfa2544d38cae97b6101e2ea7544d198be0db01098bf13b761d063'
            'fc1e0ba3114b3f8b007b6f9fcc2b87c05c9fe12ebc58de66993a24da19d94ed3'
            'ad926e9a170d96519eab7553c94462d7849d55c4886c9b5d386782090e321fd6'
            '933d21ce95099aed7645ed44c32459eb040cc142db865a3bf5d63e1996b997aa'
            '0bb2941f7f0fbc71dae156f69a4cf3d1469bfdbf6e1ff1bfe6e8d8397eff3abd'
            '60ef3adc6c1847c46e1abd7a8062255aa3e2ce1db2c08dfb1fd43f1a46207736'
            '9a1efcd3b99c0ef88e1fbdf361a7832f09a925802a7518629f271ff8e08ae940'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
