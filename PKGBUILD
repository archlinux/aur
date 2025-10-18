# Maintainer: Kruemmelbande  (kai.scheufen@gmail.com)
# Contributor: Kruemmelbande
pkgname=slimevr-beta-bin
pkgver=0.16.3
pkgrel=2
epoch=1
pkgdesc="SlimeVR FBT software beta version"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server/"
license=('MIT','Apache-2.0')

depends=('gst-plugins-good' 'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'jre17-openjdk' 'libappindicator-gtk3' 'libsoup3' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=(
  "https://github.com/SlimeVR/SlimeVR-Server/releases/download/v0.16.3/SlimeVR-amd64.deb"
  "safemode-slimevr.desktop"
)

sha512sums_x86_64=(
  "6ddfe18ee3842ecced2b4a264b2b4e9e809b097b245c61a0fb26d1cd6996a3a5f4a56d92d61333b8995ab6a8f9df7dc87fa9abaacdc45c514c8ea3906287fd70"
  "2f578ce345f8541746daf38296418ba809a1f75ddcfe0648a7e251b2080ef8b9f980a2a00fb4260b9105e2254828a3fd5e107eaa040f46ab50d1b4d9a3ffeb14"
)

package() {

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"
  mv "${pkgdir}/lib/udev/rules.d/69-slimevr.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  install -Dm644 safemode-slimevr.desktop "${pkgdir}/usr/share/applications/"
  rmdir "${pkgdir}/lib/udev/rules.d/"
  rmdir "${pkgdir}/lib/udev/"
  rmdir "${pkgdir}/lib/"
  rm "${startdir}/SlimeVR-amd64.deb"
}
