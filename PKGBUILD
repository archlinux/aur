# Maintainer: Micraow <15190450708 at 163 dot com>
pkgname=stuhelper-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="AI gateway desktop assistant for BUAA students - one-click bridge to Claude Code / Codex (binary release)"
arch=('x86_64')
url="https://github.com/Micraow/MoonBridge-Release"
license=('custom')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('stuhelper')
conflicts=('stuhelper')
options=('!strip')
source=("stuhelper-${pkgver}.deb::https://github.com/Micraow/MoonBridge-Release/releases/download/v${pkgver}/StuHelper-v${pkgver}-linux.deb"
        "LICENSE")
sha256sums=('97741d8813e5b839fdc6d663bb906680ad84115031a6117d31e9468c7acdeaae'
            'a607afaac61dfc4a32e4d54b00eee51443bf34aa1b7f4fecf80750fdc25a4c22')

package() {
    # makepkg 已把 .deb 解成 debian-binary / control.tar.gz / data.tar.gz，
    # 这里把 data 段的 FHS 布局原样铺进 $pkgdir
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
