# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=10
pkgrel=2
pkgdesc="Integration layer for dracut and systemd's ukify tool for Arch Linux"
url="https://aur.archlinux.org/packages/dracut-ukify"
arch=(any)
license=('MIT')
depends=(dracut 'systemd-ukify>=254')
optdepends=(
	'sbsigntools: secureboot support'
)
source=('10-dracut-ukify-pre-install.hook'
        '60-dracut-ukify-remove.hook'
        '90-dracut-ukify-dkms-remove.hook'
        '90-dracut-ukify-install.hook'
        'dracut-ukify'
        'dracut-ukify.conf')
sha256sums=('c1be3eaf920282c15fba17e22be3d38c407a1b2c502028677950978286a85585'
            'dd9e0c08220467ee994cac81779c5241802de23dc98b849dc2c54a32d34aff9b'
            'd96d34365c49fe1b5295c304fdc84bd4e6a74302dda3da9bb62220c891dea4fd'
            '4efc18bb4bf68b67aa7e7422484082e956e0cbb04404c8273bc27d1d2f4a04c9'
            '8498965c2fe03d9be2810b40e9d4e196d0d3d950bf637f8f22fa8a49ca4195ec'
            'd6a7ac3a97fccdfd47e9bd72699130c6ac5b6a8ce791c7eaea5f1e29d54f8772')
backup=(etc/dracut-ukify.conf)
provides=(dracut-hook)
conflicts=(dracut-hook-uefi dracut-uefi-hook)

package() {
  install -Dm644 "${srcdir}/10-dracut-ukify-pre-install.hook" "${pkgdir}/usr/share/libalpm/hooks/10-dracut-ukify-pre-install.hook"
  install -Dm644 "${srcdir}/60-dracut-ukify-remove.hook"      "${pkgdir}/usr/share/libalpm/hooks/60-dracut-ukify-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-ukify-dkms-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-ukify-dkms-remove.hook"
  install -Dm644 "${srcdir}/90-dracut-ukify-install.hook"     "${pkgdir}/usr/share/libalpm/hooks/90-dracut-ukify-install.hook"
  install -Dm755 "${srcdir}/dracut-ukify"                     "${pkgdir}/usr/bin/dracut-ukify"
  install -Dm644 "${srcdir}/dracut-ukify.conf"                "${pkgdir}/etc/dracut-ukify.conf"
}
