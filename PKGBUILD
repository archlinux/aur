# Maintainer:  Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>

pkgname=ferdi-bin
pkgver=5.4.0
pkgrel=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more. fork removing the non-skippable app delay frequently inviting you to buy a licence'
arch=('x86_64')
url='https://getferdi.com/'
license=('Apache')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
optdepends=('gnome-keyring')
conflicts=('ferdi' 'ferdi-git')
source=("https://github.com/getferdi/ferdi/releases/download/v${pkgver//_/-}/ferdi_${pkgver//_/-}_amd64.deb"
        "ferdi.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Extract package data
  bsdtar -xJf data.tar.xz

  # Install package data
  mv "usr" "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  mv "opt/Ferdi" "${pkgdir}/usr/lib/ferdi"
  ln -s "../lib/ferdi/ferdi" "${pkgdir}/usr/bin/ferdi"

  # Permission fix
  chmod 644 "${pkgdir}/usr/lib/ferdi/"*.so

  # Install icon
  install -Dm 644 "$srcdir/ferdi.desktop" "$pkgdir/usr/share/applications/ferdi.desktop"

  # Link licenses
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/ferdi/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s "/usr/lib/ferdi/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}

