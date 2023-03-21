# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Witalij Berdinskich <radio_rogal at keemail dot me>

pkgname=slf4j
pkgver=2.0.7
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
         '4e8d6cd31f7e6277280c95157ac7845a'
         '965fd8c7c67bd57eb63b321d0bedf498'
         'db6e1607a18fce4878c6706c144c4484'
         '403dffa46cdd2e3c82da19df4f394a4c'
         '2580cc19f2bbbe61cc95526f0bd9338c'
         '10c4635f7d9105229bc577e0a7b37a81'
         '46103a7177ee22bfb3c2723651a7bccb'
         '14a4437829a1184642957a74b64d2ae5'
         '9052ae0144e42ae4eac4f08c1d3b6a94'
         '2f6dd5da0703850d4af89524b38e250e'
         'dc577595071657290ba80857958dd909'
         '9939d1d46aa38b00af24f36b6f59b0f0')
sha256sums=('6fbe2eaf44b193b8a40eed9208f52848572224ad8d7672dd09418aa174847e73'
            '41806757e1d26dae5d6db2ca7d4a5176eed2d6e709cd86564d4a11dab0601742'
            'eaba65483bb38c93e68d557a19e5738962322de1946545dbf40e5e32f6293008'
            'fc57714ee8b1e4ab39b9488c157f0843de71ba6708252cbe06c994ad9d72d1ee'
            '5d6298b93a1905c32cda6478808ac14c2d4a47e91535e53c41f7feeb85d946f4'
            '74f23f8852e1eee46bb269f95de512c5e93ae3bb33b71ed21dc50e87b0b2adbb'
            'f904709af2170f3ce6ccfd6e5983899dd898c815a47fc475c8db5e29828477f7'
            '288df4ecc45544326903ea4bdc618406ca8e206ab0d80f4fac8ccb06e823aeac'
            '674cc6ce464c2df9d90aa03f09865c5a15c075232e2ff3eae30c782e26a28ef0'
            '5411a0d44e2725182271230b9fb4c2c4062c1b5fa7df2d83e00c0302733db173'
            '50eae3f1cc9a78a970970518e005d3f43d5cd3262d234f47ebdf3ca3f8bc01a7'
            '95e460406c5b9416bb51eb452e40b2d8987401e55cdd3da6b062851cd0e56e82'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
