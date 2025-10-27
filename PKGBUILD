# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=slf4j
pkgver=2.0.17
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
            'affd06771589ebfe454bb11315a4f466ecaa135b95f3e7939534cf1d2fd7064c'
            'a7afcd23b9cfd1475e55c94f943b808c5922035e7e2c2a5c65a487a4106bc538'
            'cbf30eaf95357ab7babf9be123da9cc702f0fe83b23392b7a62589d60b5862d1'
            '44f5c4c7f52f31b5f208ce10b4a6b12289515fc8ae8f80add1478d6342b07df1'
            '7b751d952061954d5abfed7181c1f645d336091b679891591d63329c622eb832'
            'e2e4fc169a0b65df4f12f7c577efd4f47619914eb8c5571418b65769d6ff9cb4'
            '36f6a35b83ce2dd8d269c1c437ef3a7d05a0122f0f392886878ed74548401af8'
            'ead25c1b15f59db1fb5552b76fe63de4164f0df40024d19287b75dece47ad3be'
            '62dfd069563dbce91d276c9a38d557da49df7be15b03bb898b63b5390c6bb889'
            '5126b13d2a2fe984d4b272504cd459f1bd0080847bfe1931099d148f69d49d8a'
            '3716f83649ec66161a2edefd4f49df34d1dd1c51cdcf941996c6987260f0a829'
            'ddfea59ac074c6d3e24ac2c38622d2d963895e17f70b38ed4bdae4d780be6964'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
