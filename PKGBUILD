# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=4
pkgrel=2
pkgdesc="Integration layer for dracut and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/dracut-ukify"
arch=(any)
license=('MIT')
depends=(dracut systemd-ukify python util-linux python-pefile)
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-dracut-ukify-pre-install.hook'
        '90-dracut-ukify-install.hook'
        '60-dracut-ukify-remove.hook'
        'dracut-ukify'
        'dracut-ukify.conf')
sha256sums=('e9592f4f738e8ac70044db1e3f0c4839bc07f37662d5dbc221230cf1617a6b4d'
            '08225b2c3f5e2a734561b5fa9a3e84060dfffd85b2898adb0fff0ce3b068b4d0'
            '341cd01546d840e7401f7bec868a78e2f6ca12563e93d993a07bc51efe674ed0'
            '5655fbb724c94950e60a53487f9726f2eddf2603ce3efc01b5fdf2198a080eb6'
            '3af44f1790a923cb87732ca936af9d0a4753c8cd9633353ee1cb1ffb5cec2a01')
backup=(etc/dracut-ukify.conf)
provides=(dracut-hook)
conflicts=(dracut-hook-uefi dracut-uefi-hook)

package() {
  install -Dm644 "${srcdir}/10-dracut-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-dracut-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-dracut-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-dracut-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-dracut-ukify-install.hook"
  install -Dm755 "${srcdir}/dracut-ukify"                     "${pkgdir}/usr/bin/dracut-ukify"
  install -Dm644 "${srcdir}/dracut-ukify.conf"                "${pkgdir}/etc/dracut-ukify.conf"
}
