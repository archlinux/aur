# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=tomighty
pkgver=0.7.2
pkgrel=1
pkgdesc='Desktop timer for Pomodoro Technique users'
arch=('any')
url='http://www.tomighty.org/'
license=('Apache')
makedepends=('imagemagick' 'maven')
source=("git+https://github.com/tomighty/tomighty.git#branch=version-0.7"
		'tomighty.sh'
		'tomighty.desktop'
		'https://github.com/ccidral/tomighty/raw/50d0094c024f1923bd0d6ff1bf77572ae5f5b5f6/img/tomato.ico')
sha512sums=('SKIP'
            '97e1aa44a6037af9bd4bbbd131dd1a7c6657cbac4875b83f0bfa075bea9164ba642ca0d09c0490401d2c567048391d48deff10c8d215d53de6e36f23909e90b8'
            'f01a72c3777d6dcda7ee78b0025a5474165559f4049d4d76b4f5824dba8ecf83835f2e4de6dbecc6451a658d90e36ee8d475840f90cb90f9d6e869318627af29'
            'aa2207bc686167931f21a722c0b7bbb644ac97cbb89d53948436dbfcdc05a18b98b42feed60a05abba7c8db12946f6350fb5b7b5514d9680652af0f8050975e4')
build() {
	cd ${srcdir}/${pkgname}
	mvn clean package
}

package() {
	convert ${srcdir}/tomato.ico ${srcdir}/tomato.png
	install -Dm 644 ${srcdir}/tomato-0.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	install -Dm 644 ${srcdir}/${pkgname}/target/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 755 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}
}
