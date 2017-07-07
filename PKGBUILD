# Maintainer <tianyu at vt dot edu>

pkgname=pinegrow
pkgver=3.01
pkgrel=5
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('custom')
depends_x86_64+=(gtk2 glib alsa-lib nss libxss linxtst)
source=("https://pinegrow.s3.amazonaws.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf")
noextract=("Pinegrow_EULA.pdf")
sha1sums=("d9dce8cac9b95e97dd9b8df93173ee94ca5ab827"
          "a69404f2d55d4c8dd8d47c54dbadad9e08573e6c")
options=('!strip')
install=${pkgname}.install

prepare() {
  cd "${srcdir}"

  unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"
}

package() {
  cd ${srcdir}
  install -D -m644 Pinegrow_EULA.pdf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  cd "Pinegrow-${pkgver}"
  printf "[Desktop Entry]\nName=Pinegrow\nComment=Pinegrow Web Editor\nExec=sh -c \"/usr/share/pinegrow/PinegrowLibrary\"\nTerminal=false\nType=Application" > Pinegrow.desktop
  install -d ${pkgdir}/usr/share/pinegrow/
  cp -R * ${pkgdir}/usr/share/pinegrow/
  desktop-file-install ${pkgdir}/usr/share/pinegrow/Pinegrow.desktop --dir ${pkgdir}/usr/share/applications/
}
