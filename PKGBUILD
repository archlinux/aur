# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=google-play-music-desktop-player-bin
_pkgname=${pkgname%-bin}
pkgver=4.7.1
pkgrel=4
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music"
arch=('x86_64' 'i686')
url="https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-"
license=('MIT')
depends=('electron3' 'avahi' 'libappindicator-gtk3')
provides=('google-play-music-desktop-player-git' 'google-play-music-desktop-player')
conflicts=('google-play-music-desktop-player-git' 'google-play-music-desktop-player')
source=("LICENSE::https://raw.githubusercontent.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/v${pkgver}/LICENSE"
        "${_pkgname}.sh")
source_x86_64=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_i686=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${pkgver}/${_pkgname}_${pkgver}_i386.deb")

sha256sums=('7253553744e72ab40fff010dc268cbdf01c4d95f313550aaf2c9b65c1cfb7ae7'
            'fd811b5850ad1afdf2bf5c4b2434a1564339c56f250739249b23f395632c25e1')
sha256sums_x86_64=('b9d4f7fd01e4d7286af9c30c049b0c30c884f900d80f44d43d8a9bad0b4b55d2')
sha256sums_i686=('bf2ef3b1c642823825f0916616fc8afeab693a2157d79ffccc9891e9f44fd458')

package() {
  tar -xf data.tar.xz -C ${pkgdir}

  # delete
  rm -rf ${pkgdir}/usr/share/lintian
  rm -rf ${pkgdir}/usr/share/doc

  # app.asar
  install -Dm644 ${pkgdir}/usr/share/${_pkgname}/resources/app.asar -t ${pkgdir}/usr/lib/${_pkgname}/resources
  rm -rf ${pkgdir}/usr/share/google-play-music-desktop-player

  # license
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  
  # script
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}

# vim: set sw=2 ts=2 et:
