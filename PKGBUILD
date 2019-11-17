# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=nrf5x-sniffer
_pkgname='nRF-Sniffer-for-802.15.4'
pkgver=0.7.2
pkgrel=1
pkgdesc="nRF-based 802.15.4 sniffer (firmware and software)"
arch=('any')
url="https://github.com/NordicSemiconductor/nRF-Sniffer-for-802.15.4"
license=('Custom')
depends=('wireshark-cli' 'python' 'python-pyserial')
optdepends=('nrf5x-command-line-tools: for flashing firmware on nRF52840-DK (PCA10056)'
	    'nrfconnect-appimage: for flashing the firmware on nRF52840-Dongle (PCA10059)'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NordicSemiconductor/nRF-Sniffer-for-802.15.4/archive/v${pkgver}.tar.gz")
sha256sums=('10db42a9d7111bc05f353ecccd3dca81dabe282086c95fe2b6f4f430c18bb924')

package() {
  cd "${_pkgname}-${pkgver}"
  # Install license and readme
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nrf5x-sniffer/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/${pkgname}/nrf5x-sniffer/README.md"

  cd nrf802154_sniffer
  # Wireshark files
  install -Dm755 nrf802154_sniffer.py "${pkgdir}/usr/lib/wireshark/extcap/nrf802154_sniffer.py"
  install -Dm755 nrf802154_sniffer.lua "${pkgdir}/usr/lib/wireshark/plugins/nrf802154_sniffer.lua"
  # Firmware and instructions
  install -Dm644 nrf802154_sniffer_dongle.hex "${pkgdir}/usr/share/${pkgname}/firmware/nrf802154_sniffer_dongle.hex"
  install -Dm644 nrf802154_sniffer.hex "${pkgdir}/usr/share/${pkgname}/firmware/nrf802154_sniffer.hex"
}

