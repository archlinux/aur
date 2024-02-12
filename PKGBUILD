# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=slf4j
pkgver=2.0.12
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
         'c9101ee2f9fc767a92692246c7c5f025'
         '3fe62dfbc09a840168d3edc990182d90'
         'd1fa1b0128fd94fc722414aca124e651'
         '60fbee3285cb26ac549badc4f8bcbbd6'
         '86eb051f2e2d6497a3a57810c963a9d6'
         '2230339dc2994e7ae1099956562da509'
         'd3480cc37207d4994444f3705ffc37b9'
         'eebad061b74eac1e98c51d7d2ab9a07d'
         '8913b1eaae8ea992efa6164cfb970697'
         '84a5082eb07ec313ac62629695662c7d'
         '0b1c175c7a61070d1b8101cbca19135e'
         '66daf0383d0fef0dbac0d8eb7dbe4e49'
         'dc577595071657290ba80857958dd909'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            '3377f1bd98ef33e52bc29b4d6cca960715cffbf1a398a3824ae86486db04342f'
            '84f02864cab866ffb196ed2022b1b8da682ea6fb3d4a161069429e8391ee2979'
            '6271f07eeab8f14321dcdfed8d1de9458198eaa3320174923d1ef3ace9048efa'
            '0ac5aaa04db17a58297138b2fea9326004c9a4e885eb7d0ed37a59d5fada17de'
            'a79502b8abdfbd722846a27691226a4088682d6d35654f9b80e2a9ccacf7ed47'
            '3103864317c84659929604aa81c62fc3141c483b068609f480a7627e8f12e8c0'
            '4cca0aa13734205a248dbcef080316c1c1f05b594e20dc014470e2debf8e9352'
            '26468d004a9cb8575703024e20b29a3839194f0abf1f4f79ee0b21c5d4900efd'
            '5a00626d88d9534df9fa34b599387bfa5284884ff52128dcbf6f426d7bbb0e16'
            '26c515f4a6c17865d58cab3e2fafc0c53311aad39dd7e8786aad0899e9d39541'
            '828d622a52538efd2a460552d8cc345a7a19a9fd686390ced8040e30462897f2'
            '4cd8f3d6236044600e7054da7c124c6d2e9f45eb43c77d4e9b093fe1095edc85'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
