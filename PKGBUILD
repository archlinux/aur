# Maintainer: Aliom <aliom_@outlook.com>
pkgname=dev-janitor-bin
_pkgname=dev-janitor
pkgver=2.2.9
pkgrel=1
pkgdesc="Dev Janitor - A developer tool management app (Binary release)"
arch=('x86_64')
url="https://github.com/cocojojo5213/Dev-Janitor"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libappindicator-gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")

# ⚡️ 魔法链接：使用 'latest' 自动跳转到最新发布页，不管 Tag 叫什么
source=("https://github.com/cocojojo5213/Dev-Janitor/releases/latest/download/Dev.Janitor_${pkgver}_amd64.deb")

sha256sums=('SKIP')

package() {
    # 1. 解压 deb 包
    bsdtar -xf *.deb -C "$pkgdir"

    # 2. 处理 data.tar.xz (如果有的话)
    if [ -f "$pkgdir/data.tar.xz" ]; then
        bsdtar -xf "$pkgdir/data.tar.xz" -C "$pkgdir"
        rm "$pkgdir/data.tar.xz" "$pkgdir/control.tar.xz" "$pkgdir/debian-binary"
    fi

    # 3. 修正权限
    chown -R root:root "$pkgdir" || true
}
