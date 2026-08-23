# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew.info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash
pkgname=tcos-pkcs11
pkgver=1.20.1
pkgrel=1
pkgdesc="PKCS#11 driver for TeleSec TCOS smartcards"
arch=('x86_64')
url="https://www.telesec.de/de/service/downloads/produkte-und-loesungen"
license=('LicenseRef-EULA')
install=$pkgname.install
depends=('glibc' 'libgcc' 'libstdc++' 'pcsclite')
source=("https://www.telesec.de/assets/downloads/SecureElements-Smartcards/PKCS11-SDK/libpkcs11tcos_Linux_PCSC_${pkgver//./-}_x86x64.zip"
  "https://www.telesec.de/assets/downloads/SecureElements-Smartcards/Nutzungsbedingungen-TCOS-Treiber-und-Managementsoftware.pdf"
  "p11tcos-netkey.module")
sha512sums=('ef796366a05008fbf78113b72a150994b7933f86b3564f62a11135fb1c8ae55ce36f7d132e2ff93426e5dfb4bea6cf0be8c8e3a707be66ff177cf0d2bfe13dc2'
  'fcdaee3d596501fff5b8cb554b2c2ac06ff96d056f5d78a6e6a303d76d914c947c361ffa61629a5dce8027e9a84e85f6b2a814bd3d04ad098302b32f77c1820e'
  '3c694e596c4d4782522d5e553b6eea561a06c4128216379e285a281986aaa568451990242205ad37209086add357d3f2a9cdc1ceb6a434276596bb9ba9bf2563')
b2sums=('f0bcd6cfbef0258a72b234aae19bd962123a4d076115a20f97f157443f75ae765ff4275c76a90fb1d74d3efcfaca2b9785778ef78096765d29045ed2af3b9f84'
  '14581e087f579c0d10e57cfc242798c46e2a57b77c35c5d04760adaefd0c498d9775a77896b8a1c87047ca322963fb34bbcfb7c1e962a1c2ce191b06a1947650'
  'f0ba50cf134d9be16cee0262a641bc4b644be4c1b81ab574e0bae64d85e6cb39f91ac6cb80c3e5cb8ff1e15ed4bbfed67f489818e2e3219fd25ce5804c335396')

package() {
  install -Dm644 "Nutzungsbedingungen-TCOS-Treiber-und-Managementsoftware.pdf" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "p11tcos-netkey.module" -t "${pkgdir}/usr/share/p11-kit/modules/"
  cd "libpkcs11tcos_Linux_PCSC_${pkgver//./-}_x86x64" || exit
  install -Dm755 ./*.so -t "${pkgdir}/usr/lib/pkcs11/"
  install -Dm644 "ReleaseNotesLinux ${pkgver//./-}.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
