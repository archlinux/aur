# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>

pkgname=slf4j
pkgver=2.0.13
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
         '1760aae467a5ac09abdccef211fddd89'
         'd44cfe5a86dae2488e228cac617c6f0e'
         '7001aab64046efc897555a2d8906f5e1'
         'de6a0e8642982b3be0a467e6f7de937c'
         '7f4028aa04f75427327f3f30cd62ba4e'
         'd65f8a7e4347b8e5ae77897a9440bb0b'
         'f1e9a007826032162cc2e222cae96720'
         '354fa90039a9336a23f1a34dbca0ce9e'
         '2af84489be016394234b4c7c1c69b42b'
         '4880106ae5dfc2a4b282193c813a31f2'
         '9fc96c487556ee4b3e0ca498e90b394c'
         '4196990c1480726609474e897fe0bdc7'
         'dc577595071657290ba80857958dd909'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            'c53560fa3a0837964207dd1f7835d0e6cea0835bd110e94696f2dc65f27e6f5a'
            'fa5ed8f23df2158d0d4d5c82f85cae289d36cc3cd7b7497deff5a37b0b7d7878'
            'fe55a985e82370e5c457119a79195a4639cbd6ffa73963d4fdae85dfa228e724'
            'd9b46b52ccceb78b64ad11d454cdf2c2f2c317a0d43b8b9ba33108063aaf1ce9'
            'e7c2a48e8515ba1f49fa637d57b4e2f590b3f5bd97407ac699c3aa5efb1204a9'
            '9963ed4a45df1ad7d197f6940e99b8063edab645370d427bea4901bad5846c95'
            'fe53a727b14c6486675d292cb059be3d3c9b5c1081a8ecb9cdaf2e06c7fcf984'
            '83f17205a6470c3cd4214306d3ed011651c173297f705acef544c01795f253cd'
            'e5c88ca5558c7456afc2cc52ad0f4f4b965eac48e72348677f8a5529aba8ebd7'
            'b4e833686f144f3d381419457697faf35effeebd4461adb8f30dc74ef17e7119'
            '8962a107b4a8bdf80b6c17e470cd3614ad3329643833ff5cf0c60c7dce9deaac'
            '3153fe1d689cffb94f1530b58470c306685ba68844de8857116e3b6ebb81d9f7'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
