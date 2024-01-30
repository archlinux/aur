# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=slf4j
pkgver=2.0.11
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

md5sums=('91cf470930de587e31989fcee4fb5ab2'
         '7ad2cbcec0efd8cfc8f3a6dfacfc5829'
         '46568e80d6a97fd041864e033dfdf7d0'
         'b244652ac43fa98ae6f15d94196495f4'
         'b4960ebe9819eccbfb1a9f8c25b31f57'
         '90c46a2d4613049843c804867321e6a7'
         '7886fb244088b31efef3a3e7fa100996'
         '2f360c781b57d3399004e9d14d85fd35'
         '321c887ba4882fabdceadba870aac582'
         '825bbac877885da89592d9237f4ca95a'
         '39af55ea5d8787eca12555e57dff38da'
         '95645ea0898c16c60ce0eebb48b2e11b'
         '81b8dd6091b8617476556be6f4f9ab0b'
         'dc577595071657290ba80857958dd909'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            '55e96f9830d732c81f0709e9090f308798381be7dc5aa67dd423c02831b5b4bb'
            '67e605b1f3efd4efcb060e4c11a2e6d8d4dfd2262bba7916aeafa77eeb1bcf89'
            'bfc61960f31ac39f1a3fce0b102f4fc084e5b936f1d7329ea69840462a3cac7f'
            '748da7d614f3279d90e3181f6629497a02d4b0dbef430978ada8e4e6e937c4f5'
            'ce0e71d673acb9036bb55d0244b261cf033f8e4c1245f14f931dfb1937dd4c95'
            'd1367fad7fdb46382e32fc26fc1865734a6331f6aacdc5e5b07861d8aeff2b11'
            'c15b32dc1ca26fc7a4fce5712eadee793c78e3eb2856a1a85acae9ce3b05aedb'
            '1ce8ae1f20dec00a0ac08bb92a773168a57651bac69869a457285a5a7c8c7097'
            '8d3914821186c433a8cf8531d488d118bbf8b50830530bc8841643daf3f4929a'
            'ff994724ad46784a5e609a7f34bc16be1251b350da32e93042ac287ca8d85d6a'
            'fcf8131955e401c384bce6f129ef5aafb51ebc225309df05860dc9fd6723c58b'
            'bb3c7e2e144dcdf022fe17775286a3623e69d75b7f52d9b62451871d0c82a513'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
