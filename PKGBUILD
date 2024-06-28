# Maintainer: Sergey Shatunov <me@aur.rocks>

pkgname=dracut-ukify
pkgver=8
pkgrel=6
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
sha256sums=('7be65bccc0e7b861961cc8902a120d8c0bf5cfce8ba83e2ade8aa772c4b4417f'
            'dd9e0c08220467ee994cac81779c5241802de23dc98b849dc2c54a32d34aff9b'
            'd96d34365c49fe1b5295c304fdc84bd4e6a74302dda3da9bb62220c891dea4fd'
            'fdf700f716ebedf2b1da92a2b013a1ef93249e853a241d9f0581690b522db814'
            '32892e3f3c74e302bf6aa72e5608eafbae2efdcfe1ae3ecea20b6ddb97d8695c'
            '931704a244590b64e9640a20e1c92b869c9c2574f770b3abcd76b1a801bb2792')
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
