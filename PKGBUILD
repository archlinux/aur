# Maintainer: Márk Sági-Kazár <mark.sagikazar@gmail.com>
# Maintainer: Bence Hornák <hornak.bence@gmail.com>

pkgname=anyk
pkgver=2.93.0
subver=0.1
pkgrel=1
pkgdesc='Form fill program of the hungarian tax office (Általános Nyomtatványkitöltő (ÁNYK))'
arch=('any')
url='https://www.nav.gov.hu/nav/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/abevjava_install.html'
license=('proprietary')
depends=('java-environment>=8')
makedepends=('unzip')
provides=('abevjava')
source=("https://www.nav.gov.hu/data/cms504163/abevjava_install-${pkgver}-${subver}.noarch.rpm"
        'abevjava'
        'abevjavapath.cfg'
        'anyk.desktop'
        'setenv')
md5sums=('303907492bf06ffc0d8a2814cad3ff35'
         '045b61f09cd7094cfbfe822fc6bb4377'
         '5dae655a84d5dd76401011f5629d8f0f'
         '0f560ca83f761b9b59f16274666b74e2'
         '8e44755f86c9cc159ec7a4ff681e78f2')

package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/usr/share/abevjava"
    install -d -m 755 "${pkgdir}/etc"

    unzip -oq "$srcdir/usr/share/abevjava/abevjava_install-$pkgver-${subver}.jar" -d "$srcdir"
    install -m 655 "${srcdir}"/abevjava_* "${pkgdir}"/usr/share/abevjava
    install -m 655 "${srcdir}"/setenv "${pkgdir}"/usr/share/abevjava
    install -m 655 "${srcdir}"/abevjava "${pkgdir}"/usr/bin
    install -m 644 "${srcdir}"/abevjavapath.cfg "${pkgdir}"/etc

    install -D "${srcdir}/${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
	install -Dm 644 "${srcdir}"/application/abevjava.png "${pkgdir}"/usr/share/pixmaps/abevjava.png

    cp -r "${srcdir}"/application/* "${pkgdir}"/usr/share/abevjava
}
