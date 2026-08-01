# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=uotantoolbox_linux-bin
_pkgname=UotanToolbox_Linux
pkgver=3.7.1
epoch=1
pkgrel=1
pkgdesc='鱼柚坛工具箱 NT,为玩机发烧友而生。'
arch=('x86_64' 'arm64' 'loong64')
url="https://toolbox.uotan.cn/"
license=('GPL-3.0')
depends=(
    'usbutils'
    'android-tools')
source=("LICENSE.txt")
source_x86_64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_x64_$pkgver.deb")
source_arm64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_arm64_$pkgver.deb")
source_loong64=("https://github.com/Uotan-Dev/UotanToolboxNT/releases/download/$pkgver/${_pkgname}_loong64_$pkgver.deb")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('85e0c4b9fa80a5e652258504f61abea4e56108dcd8558367c00a99fa8cc3c2bf')
sha256sums_arm64=('e2827d9dc111f2af07f7304efc886b9549c329cf4d9e3240311dbf49d234583f')
sha256sums_loong64=('86dcf2871fc5b3a021eb88946b84550b18239c33512f201a5e6d490b3c798496')
options=('!strip' '!debug')

package() {
    bsdtar -xf "${srcdir}/data."* -C "$pkgdir/"
    install -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/lib/UotanToolbox" "${pkgdir}/opt/"
    sed -i '5i\Name[zh_CN]=柚坛工具箱' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    sed -i 's/^Categories=.*/Categories=Utility;/' "$pkgdir/usr/share/applications/UotanToolbox.desktop"
    sed -i 's|/usr/lib/UotanToolbox|/opt/UotanToolbox|g' "${pkgdir}/usr/bin/UotanToolbox"
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    rm -r "${pkgdir}/usr/lib"
}
