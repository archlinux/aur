# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=slf4j
pkgver=1.7.30
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
            '71e9ee37b9e4eb7802a2acc5f41728a4cf3915e7483d798db3b4ff2ec8847c50'
            'bbcbfdaa72572255c4f85207a9bfdb24358dc993e41252331bd4d0913e4988b9'
            'ad9d34d0b7f0bf576be2b5f844988fd872bb99f87ecffa41d54a8ebaad79a10b'
            'cdba07964d1bb40a0761485c6b1e8c2f8fd9eb1d19c53928ac0d7f9510105c57'
            'd56010e891107179fee0b298510303c028733b83a4363c4bfbe7b82e6d3a8c53'
            '6fa998aa9a036afdef526e2f2505f8aa00971d4b239e247d8cf7cdd1a5a364d7'
            'e0f9db049378f6467941771454995233285fb7adf72c467e65daf25e673acba8'
            '4d41e01c40caf8a6c74add2b073055d8a4ce1c30e58154177b13f12d78abbe7b'
            'ebbb1fff0c4f2ec9f0efe07183ecfa670f43888d990677be76991cf3e8a7ee83'
            '2d550dcefaea23d223b72027dbc7cbdb7327676ccefdd9cfe49cf9ea8e9ac8e0'
            '8b9279cbff6b9f88594efae3cf02039b6995030eec023ed43928748c41670fee'
            '9a1efcd3b99c0ef88e1fbdf361a7832f09a925802a7518629f271ff8e08ae940'
            '3fa0fb54bd4b0cd91e16b882002943d0ea3d0985ecf8fa870c9afc9b73656dba')
