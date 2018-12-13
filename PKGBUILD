# Maintainer: SaMaLerO <smlr[at]ukr[dot]net>
# Co-Maintainer: McModder <aur @ modder.pw>
pkgname=tlauncher
pkgver=1.110.4
pkgrel=1
epoch=1
pkgdesc='TLauncher is freeware launcher of Minecraft.'
url='https://tlaun.ch'
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('java-runtime>=8' 'xorg-xrandr')
makedepends=('jq')
_checksum=$(curl -sL 'http://cdn.turikhay.ru/tlauncher/legacy_beta/bootstrap.json' | jq -r '.update.bootstrap.downloads.JAR.checksum')
# try to change repo if default sends 404
source=(#"http://turikhay.ru/tlauncher/legacy_beta/bootstrap/${_checksum}.jar"
        #"http://u.tlauncher.ru/legacy_beta/bootstrap/${_checksum}.jar"
        "http://tlauncherrepo.com/legacy_beta/bootstrap/${_checksum}.jar"
        'tlauncher.desktop'
        'tlauncher.install')
noextract=("${_checksum}.jar")
sha256sums=("${_checksum}"
            'ab05e25ac610dedf89b9554494eb56d2771789baf405d537f6ae3e2f069a115d'
            '0346fbc5e81522e498b63d392339024b8617a03de9fdf9126ba6364db94e188b')
install="${pkgname}.install"

pkgver() {
  echo $(curl -sL 'http://cdn.turikhay.ru/tlauncher/legacy_beta/bootstrap.json' | jq -r '.update.launcher.version')
}

# tlauncher.jar needs at least 666 to launch =(
package() {
  mkdir -p "${pkgdir}/opt/tlauncher"
  mkdir -p "${pkgdir}/usr/share/applications/"
  install -m0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/"
  install -Dm0666 "${srcdir}/${_checksum}.jar" "${pkgdir}/opt/tlauncher/tlauncher.jar"
}
