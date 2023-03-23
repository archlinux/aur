# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Jesse R Codling <codling@umich.edu>
pkgname=armbian-firmware-git
pkgver=20230211.56ada00
pkgrel=2
pkgdesc="Armbian-Specific Linux Firmware Files, useful for some SBCs"
arch=(any)
url="https://github.com/armbian/firmware"
license=('custom')
depends=()
provides=("${pkgname%-git}")
options=()
install=
noextract=()
source=("firmware::git+${url}.git")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/firmware"

# Git, no tags available
	printf "%s.%s" "$(git log --date="format:%Y%m%d" --format="%ad" -n 1 HEAD)" "$(git rev-parse --short HEAD)"

}


upstream_files=(
"dvb-fe-xc4000-1.4.1.fw"
"dvb-fe-xc5000-1.6.114.fw"
"dvb-fe-xc5000c-4.1.30.7.fw"
"mt7601u.bin"
"mt7662.bin"
"mt7662_rom_patch.bin"
"rt2870.bin"
"s5p-mfc-v8.fw"
"ath11k/WCN6855/hw2.0/board-2.bin"
"ath11k/WCN6855/hw2.1/board-2.bin"
"brcm/brcmfmac4329-sdio.bin"
"brcm/brcmfmac4330-sdio.bin"
"brcm/brcmfmac4334-sdio.bin"
"brcm/brcmfmac43362-sdio.bin"
"brcm/brcmfmac4339-sdio.bin"
"brcm/brcmfmac43430-sdio.bin"
"brcm/brcmfmac43430a0-sdio.bin"
"brcm/brcmfmac43455-sdio.bin"
"brcm/brcmfmac43455-sdio.clm_blob"
"brcm/brcmfmac4356-sdio.bin"
"brcm/brcmfmac4356-sdio.clm_blob"
"imx/sdma/sdma-imx6q.bin"
"imx/sdma/sdma-imx7d.bin"
"rockchip/dptx.bin"
"rtl_bt/rtl8723b_fw.bin"
"rtl_bt/rtl8723bs_fw.bin"
"rtl_bt/rtl8821c_config.bin"
"rtl_bt/rtl8821c_fw.bin"
"rtl_bt/rtl8822b_config.bin"
"rtl_bt/rtl8822b_fw.bin"
"rtl_bt/rtl8822cs_config.bin"
"rtl_bt/rtl8822cs_fw.bin"
"rtl_nic/rtl8125b-2.fw"
"rtl_nic/rtl8153b-2.fw"
"rtl_nic/rtl8168h-2.fw"
"rtlwifi/rtl8188efw.bin"
"rtlwifi/rtl8188eufw.bin"
"rtlwifi/rtl8192cfw.bin"
"rtlwifi/rtl8192cfwU.bin"
"rtlwifi/rtl8192cfwU_B.bin"
"rtlwifi/rtl8192cufw.bin"
"rtlwifi/rtl8192cufw_A.bin"
"rtlwifi/rtl8192cufw_B.bin"
"rtlwifi/rtl8192cufw_TMSC.bin"
"rtlwifi/rtl8192defw.bin"
"rtlwifi/rtl8192eefw.bin"
"rtlwifi/rtl8192eu_ap_wowlan.bin"
"rtlwifi/rtl8192eu_nic.bin"
"rtlwifi/rtl8192eu_wowlan.bin"
"rtlwifi/rtl8192sefw.bin"
"rtlwifi/rtl8712u.bin"
"rtlwifi/rtl8723aufw_A.bin"
"rtlwifi/rtl8723aufw_B.bin"
"rtlwifi/rtl8723aufw_B_NoBT.bin"
"rtlwifi/rtl8723befw.bin"
"rtlwifi/rtl8723bs_ap_wowlan.bin"
"rtlwifi/rtl8723bs_nic.bin"
"rtlwifi/rtl8723bs_wowlan.bin"
"rtlwifi/rtl8723bu_ap_wowlan.bin"
"rtlwifi/rtl8723bu_nic.bin"
"rtlwifi/rtl8723bu_wowlan.bin"
"rtlwifi/rtl8723fw.bin"
"rtlwifi/rtl8723fw_B.bin"
"rtlwifi/rtl8821aefw.bin"
"rtlwifi/rtl8821aefw_wowlan.bin"
"ti-connectivity/wl18xx-fw-4.bin"
)

prepare() {
	echo "  ->  Removing upstreamed files..."
	for f in "${upstream_files[@]}"; do
		rm "$srcdir/firmware/$f"
	done
}

package() {
	install -d "$srcdir/firmware" ${pkgdir}/usr/lib/firmware
	cp -rpdt ${pkgdir}/usr/lib/firmware/ "$srcdir/firmware"/*
	if [ ! -e ${pkgdir}/usr/lib/firmware/brcm/BCM4345C0.hcd ]; then
		ln -sr ${pkgdir}/usr/lib/firmware/brcm/BCM4345C0.radxa,zero2.hcd ${pkgdir}/usr/lib/firmware/brcm/BCM4345C0.hcd
		# add generic symlink for BCM4345C0 if missing
	fi


}
