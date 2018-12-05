# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='Everest'
pkgname='everest'
_pkgver=Alpha-1.3
pkgver=a1.3
pkgrel=3
pkgdesc="A beautiful, cross-platform REST client."
arch=('any')
url="https://github.com/RohitAwate/Everest"
license=('Apache')
depends=('java-runtime>=8')
makedepends=('java-environment>=8'
             'java-openjfx'
             'maven')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
install="${pkgname}.install"
source=("https://github.com/RohitAwate/${_pkgname}/archive/${_pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha512sums=('c7c4c5f9612a178e31764083730fbc5a088e8f2acd1e6b4950b9aedcabc34f67da66837529f8832735e06ce0e42cac8578bb8e304e74438bbb6a0aeec6ecb797'
            '5d0f5c1d75857251b2d0802c552b9e269a0472d45e4904930fda0040dfb3efe5270506bf523e6a8d13df8337f92c2487966b181b79898a81510a8abcccd0ff8c'
            '7a1ccb28be328d1917f826778998e6011a6a667f360d4b139394683a42a1bfe7cd6f1500cdf1d5e504ef888fb67d73e73ef9b28022d93e7a9e714e5fecac7dca'
            '49e2f7a074d7777537f7a766994ae2c75d75f8993fdbfa72f0b43261cb6ba6af6094cac5fde70b64e82903d4cd1f1735ad195f2a419705991c963c92a8b9796f')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    mvn package -DskipTests
}

check() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    mvn test
}

package() {
    install -m 644 -D "${srcdir}/${_pkgname}-${_pkgver}/target/${_pkgname}-${_pkgver}.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
    install -m 755 -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -m 644 -D "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -m 644 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
