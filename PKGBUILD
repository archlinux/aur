# Maintainer: Zaeroses <email dot zaeroses at gmail dot com>

# Issues and bugs regarding the Quiltflower decompiler can be reported to the official bug tracker at:
#       https://github.com/QuiltMC/quiltflower/issues

# Support & questions regarding Quiltflower can be found in the official Discord community for
# Quilt Toolchain projects:
#       https://discord.quiltmc.org/toolchain

# Information on contributing to the Quiltflower decompiler can be found at:
#       https://github.com/QuiltMC/quiltflower/blob/master/CONTRIBUTING.md

# Visit the official Quiltflower GitHub repository for more information.

# The maintainers and contributors to this AUR package are not affiliated with QuiltMC. Questions
# and/or bugs related to the AUR package specifically should be commented on the AUR package page.

pkgname=quiltflower
pkgdesc='Java decompiler focused on improving code quality, speed, and usability.'
pkgver=1.8.1
pkgrel=3
arch=('any')
url="https://github.com/QuiltMC/${pkgname}/"
license=('Apache')
depends=('java-runtime' 'sh')
provides=('fernflower=r482.7f65f48b' 'fernflower-git=r482.7f65f48b')
_file="${pkgname}-${pkgver}.jar"
source=("${url}releases/download/${pkgver}/${_file}")
noextract=(${_file})
sha256sums=('aac513ef9f9ddafca94ba2992b2a5cab68d18694f07f2c638d0f92110956e01b')

package() {
    # place jar file in /usr/share/java/quiltflower/quiltflower-x.x.x.jar
    install -Dm644 ${_file} "${pkgdir}/usr/share/java/${pkgname}/${_file}"

    # place a script that will launch the jar file in /usr/bin under the name quiltflower
    install -d "${pkgdir}/usr/bin"

    printf "#!/bin/sh\n" > "${pkgdir}/usr/bin/${pkgname}"
    printf 'exec java -jar /usr/share/java/%s/%s "$@"\n' ${pkgname} ${_file} >> "${pkgdir}/usr/bin/${pkgname}"

    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
