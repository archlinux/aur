# Maintainer: Luke Short <ekultails@gmail.com>

pkgname=linux-firmware-valve
# There are two source packages that use a date version. Set the PKGBUILD version to mirror whichever source is newer.
pkgver=20231113.1
pkgrel=3
pkgdesc="Firmware files for Steam Deck devices from SteamOS"
url="https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/"
# Re-using the same license from the related SteamOS firmware packages.
license=('GPL2' 'GPL3' 'custom')
arch=(any)
source=("https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/linux-firmware-neptune-jupiter.${pkgver}-1-any.pkg.tar.zst"
        "https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/linux-firmware-neptune-20230121.1f01c88-1-any.pkg.tar.zst"
        "https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/steamdeck-dsp-0.49-1-any.pkg.tar.zst")
sha256sums=("3ffdfc9634fb86fcc0e93709a4908540270eff94b26e0ceae163751acc30a806"
            "710e37390e86598630509ed9a2ece6e67cc53a479531dc1e2030199f64947a84"
            "62aebc640cabdb0fa58fceb5a6c7af0d7626453e5a34445528966a99d7e8cdf2")

package() {
    # Firmware files from the "linux-firmware-neptune-jupiter" package.
    mkdir -p "${pkgdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/"
    for ath11k in \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/amss.bin.zst" \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/board-2.bin.zst" \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/board.bin.zst" \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/boardg.bin.zst" \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/m3.bin.zst" \
      "${srcdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/regdb.bin.zst"
        do cp "${ath11k}" "${pkgdir}/usr/lib/firmware/ath11k/QCA206X/hw2.1/"
    done
    # Firmware files from the "linux-firmware-neptune" package.
    mkdir -p "${pkgdir}/usr/lib/firmware/cirrus/"
    for cirrus in \
      "${srcdir}/usr/lib/firmware/cs35l41-dsp1-spk-cali.bin.zst" \
      "${srcdir}/usr/lib/firmware/cs35l41-dsp1-spk-cali.wmfw.zst"
        do cp "${cirrus}" "${pkgdir}/usr/lib/firmware/cirrus/"
    done

    # Steam Deck OLED sound firmware files.
    tar -xvf steamdeck-dsp-*-any.pkg.tar.zst -C "${pkgdir}/"
    rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/etc/wireplumber"
}
