# Maintainer: Ayush Jha <ayush@siyasang.com>
pkgname=nekuvi-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="नेपाली कुन्जीपेटि विन्यास A better layout for Nepali Keyboards based for xkb system"
arch=("any")
url="https://gitlab.com/ayys/nekuvi"
license=('GPL')
groups=()
depends=("xkeyboard-config")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/saprasorg/nekuvi/-/raw/master/addVariantList.py" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/install.sh" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/uninstall.sh" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/level3_np" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/np" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/layout-evdev-install.hook" "https://gitlab.com/saprasorg/nekuvi/-/raw/master/layout-evdev-remove.hook")
sha256sums=('daeae22db4a6e745650be793d82b5e1c0dceb02122b3ba062d4d94bdf76154ce'
            'b7c1ab2e61d95f7fa06e3e9d3853211150d3769db5c5fbc80ce6c5804e464eb2'
            '83eb435dc710ee2fa4d9ccac12a31148673a90566e12bc198a5dc220143cdcca'
            'd5965a2ad14b8d9f6bed0bfdd37282dc1a67938577fa7fbe53d56be305583688'
            'acff172c2bfc152090678c0797f063d047686ba18b57093532cf7d8366363ede'
            'b4787622f07f2be1a94c2807bcc4c1d4e993e32f1cbf237bdc686f7930d26ca5'
            '3e334d271d5c43185cab000cda8117fa4bcd58412591d0b0a8566d68a010a5b6')


noextract=()
validpgpkeys=()

package() {
  set -euxo pipefail
  echo $pkgdir

  mkdir -p "$pkgdir"/usr/share/X11/xkb/symbols/
  mkdir -p "$pkgdir"/usr/share/X11/xkb/rules/
  cp level3_np "$pkgdir"/usr/share/X11/xkb/symbols/
  cp np "$pkgdir"/usr/share/X11/xkb/symbols/np_prog

  install -Dm 755 "${srcdir}"/addVariantList.py "${pkgdir}/usr/share/libalpm/scripts/nekuvi-add-variant"
  install -Dm 755 "${srcdir}"/install.sh "${pkgdir}/usr/share/libalpm/scripts/install-nekuvi-layout"
  install -Dm 755 "${srcdir}"/uninstall.sh "${pkgdir}/usr/share/libalpm/scripts/uninstall-nekuvi-layout"
  install -Dm 644 "${srcdir}"/layout-evdev-install.hook "${pkgdir}"/usr/share/libalpm/hooks/nekuvi-layout-evdev-install.hook
  install -Dm 644 "${srcdir}"/layout-evdev-remove.hook "${pkgdir}"/usr/share/libalpm/hooks/nekuvi-layout-evdev-remove.hook
}
