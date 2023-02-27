# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Witalij Berdinskich <radio_rogal at keemail dot me>

pkgname=slf4j
pkgver=2.0.6
pkgrel=1
pkgdesc="Simple Logging Facade for Java for various logging frameworks (e.g. java.util.logging, logback, log4j)"
arch=('any')
url="https://www.slf4j.org"
license=('MIT')
depends=('java-runtime')
source=("https://raw.githubusercontent.com/qos-ch/slf4j/v_${pkgver}/LICENSE.txt"
        "https://repo1.maven.org/maven2/org/slf4j/jcl-over-slf4j/${pkgver}/jcl-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/jul-to-slf4j/${pkgver}/jul-to-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/${pkgver}/log4j-over-slf4j-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${pkgver}/slf4j-api-${pkgver}.jar"
        "https://repo1.maven.org/maven2/org/slf4j/slf4j-ext/${pkgver}/slf4j-ext-${pkgver}.jar"
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
           "slf4j-api-${pkgver}.jar"
           "slf4j-ext-${pkgver}.jar"
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
	for i in jcl-over jul-to log4j-over; do
		install -m644 ${i}-${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in api ext jdk14 reload4j migrator nop simple; do
		install -m644 ${pkgname}-${i}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}
	done
	for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/}
	done
}

md5sums=('91cf470930de587e31989fcee4fb5ab2'
         '39ab1cc1376b4c2d1ba706a98cca83de'
         '5a22f4776707e517ff1da17a98b3918c'
         'a5ccd131feef393a926dcdfc80436d08'
         '0dd65c386e8c5f4e6e014de3f7a7ae60'
         '6b957826dc4d4b8c5e41abfb431ebc4f'
         '6bfb466df031e5d570d6f35b8679b72e'
         '54422430eb435a6f2afbc737bf7be738'
         '3db0566196d57085ca369ca74eba2718'
         'a500036dd1f3aeb615770990c7b53883'
         '20bfd59a085c41aefd95d6d0cf3d824d'
         'dc577595071657290ba80857958dd909'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            '7aee1e1a12f4e2b3b42af9453a098132339d419056c178105543f23e79633a69'
            '6466a327c5ac59fc41c98437e248b9052a4fad6fae9f83a7f723eae297990017'
            '4073298898a82f429e1ebda235a31473b1b48c347de1286735bb67922526eae4'
            '2f2a92d410b268139d7d63b75ed25e21995cfe4100c19bf23577cfdbc8077bda'
            '0f6ef03bc0291899f3fb324baba0dee02fa8c6c1adc7b465f5b923ac70379efd'
            '1e7edf2bca7f49027f602f521b1872915794ac36a2e235ffc591de2b14aacc4a'
            '3c8b0211fee94ec82033a325a3094f288480601014ed0f415ac195d9e0f1989e'
            '757f3500cc7a15f181188ad71ae6a81e076bba7618143399dbc6d2fbce895c7b'
            '7966dcd73078250f38595223b1e807cd7566188a56236def031e265426056fc8'
            '547f06226cfcbcca198669e7498f6a6d2a55a84de5dd6eb46579f11fc40fc5d8'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
