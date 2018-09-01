# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Alexander Fehr <pizzapunk gmail com>
#
pkgname="jclic"
pkgver="0.3.2.9"
pkgrel="1"
pkgdesc="Java applications for educational activities."
arch=('any')
url="https://clic.xtec.cat/legacy/en/index.html"
license=('GPL2')
depends=('java-environment')
provides=("${pkgname}")

source=("${pkgname}-${pkgver}.zip::http://clic.xtec.cat/dist/${pkgname}/${pkgname}-${pkgver}.zip")
sha256sums=('c0134f552de35f0a819f37d9572b92f5fad038cd0268f2782138c2cc9226fcbc')

_jclic_desktop="[Desktop Entry]
Name=JClic
Exec=java -jar /opt/jclic/jclic.jar
Icon=/opt/jclic/icons/jclic.png
Type=Application
GenericName=Educational activities
GenericName[fr]=Activités éducatives
Comment=Create and organize your library of activities
Comment[fr]=Créé et organise votre bibliothèque d'activités
Terminal=false
Categories=Education;"

_jclic_author_desktop="[Desktop Entry]
Name=JClic author
Exec=java -Xmx256m -jar /opt/jclic/jclicauthor.jar
Icon=/opt/jclic/icons/author.png
Type=Application
GenericName=Create educational activities
GenericName[fr]=Créer des activités éducatives
Comment=Create educational activities
Comment[fr]=Créé des activités éducatives
Terminal=false
Categories=Education;"

_jclic_reports_desktop="[Desktop Entry]
Name=JClic reports
Exec=java -jar /opt/jclic/jclicreports.jar
Icon=/opt/jclic/icons/reports.png
Type=Application
GenericName=Results of the educational activities
GenericName[fr]=Résultats des activités éducatives
Comment=Statistical reports
Comment[fr]=Rapports statistique
Terminal=false
Categories=Education;"

build() {
    cd "${srcdir}"
    echo -e "$_jclic_desktop" | tee jclic.desktop
    echo -e "$_jclic_author_desktop" | tee jclic-author.desktop
    echo -e "$_jclic_reports_desktop" | tee jclic-reports.desktop
}

package() {
    install -d ${pkgdir}/opt
    cp -r ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}

    install -d ${pkgdir}/usr/share/applications
    install -m 644 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications/
}

# vim:set ts=4 sw=2 ft=sh et:
