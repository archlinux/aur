# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

_repo="LibreELEC/dvb-firmware"
_git="https://raw.githubusercontent.com/${_repo}/master/firmware"

pkgname=dvb-firmware-t230-hvr935
pkgver=201706
pkgrel=1
pkgdesc="Firmware for TV tuner Geniatech MyGica T230 (including T230A, T230C, T230C2) and Hauppauge WinTV-HVR-935 (including WinTV-soloHD, WinTV-dualHD)."
arch=('any')
license=('LicenseRef-SiliconLabs-Redistribution')
url="https://github.com/${_repo}"
makedepends=('zstd')
source=("${_git}/dvb-demod-si2168-b40-01.fw"
        "${_git}/dvb-demod-si2168-d60-01.fw"
        "${_git}/dvb-tuner-si2141-a10-01.fw"
        "${_git}/dvb-tuner-si2157-a30-01.fw"
        "${_git}/dvb-tuner-si2158-a20-01.fw"
        "LICENSE")
sha256sums=('d25c7deb9f69dca232ce25ab108da8ff5013d6d39088e0ec3475d97ded8af718'
            '5e1c860e95a8d92b2716b0075dd00e55f99c2c368e35340f6b527c366ff27ee7'
            '6b8d5005325c5115920827c68ab8c8e3d2e78cb5c210b61109a435b702f7adcb'
            '8b2af7f9714834106adc075bde60433a1f6d6812383e8c3f0d4e50212fb3eb5e'
            '6172e40e7884da28dc1cd08b1f082bf0339629f87d5eefbdc09dd232c1edf8e7'
            '4f4c7ef6be569c75c80089d7e98f6553cf8bfbdeda75ee27a6cc5de0d0cd6ed2')

package() {
  install -dm755 "$pkgdir/usr/lib/firmware"

  for fw in *.fw; do
    zstd -f "$fw"
    install -Dm644 "$fw.zst" -t "$pkgdir/usr/lib/firmware"
  done

  ln -s "dvb-tuner-si2157-a30-01.fw.zst" \
    "$pkgdir/usr/lib/firmware/dvb_driver_si2157_rom50.fw.zst"

  install -Dm644 "LICENSE" -t $pkgdir/usr/share/licenses/$pkgname
}
