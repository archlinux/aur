# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=('unifed-arch-kernel' 'unifed-arch-kernel-secure-boot')
pkgbase=unifed-arch-kernel
pkgver=0.0.5
pkgrel=1
pkgdesc='Generates unifed archlinux images using pacman power'
arch=(x86_64)
url='https://aur.archlinux.org/packages/unifed-arch-kernel/'
license=('GPL')
source=('uak-script'
        'uak'
        'config'
        '50-generate-efistub.install'
        '55-unifed-arch-kernel-remove.hook'
        '75-sign-for-secure-boot.install'
        '95-unifed-arch-kernel-install.hook')
md5sums=('3c73ba36f7238f359d5dc43fc6d95623'
         '15d02966c33006a8f9dc6456953e3a47'
         'cf19112a5294756657e8e2e3ebf6226d'
         '5b263fc13f06b08b3714337e28f44424'
         '9105de5ff7f384b1e48bdd4972b87917'
         '6759b0a4b35dff92e8bde49dd8bbe2e1'
         '9752535dff10105c003f9108528bd50a')

package_unifed-arch-kernel() {
    depends=('pacman' 'systemd' 'bash' 'mkinitcpio' 'binutils' 'coreutils')
    backup=(etc/uak/config)
    
    install -d "$pkgdir/etc/uak/install.d"
    install -d "$pkgdir/usr/lib/uak/install.d"

    install -D "$srcdir/uak" "$pkgdir/usr/bin/uak"
    install -D "$srcdir/uak-script" "$pkgdir/usr/share/libalpm/scripts/uak-script"
    install -D "$srcdir/config" "$pkgdir/etc/uak/config"
    install -D "$srcdir/50-generate-efistub.install" "$pkgdir/usr/lib/uak/install.d/50-generate-efistub.install"
    install -D "$srcdir/95-unifed-arch-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks/95-unifed-arch-kernel-install.hook"
    install -D "$srcdir/55-unifed-arch-kernel-remove.hook" "$pkgdir/usr/share/libalpm/hooks/55-unifed-arch-kernel-remove.hook"
}

package_unifed-arch-kernel-secure-boot() {
    depends=('unifed-arch-kernel' 'sbsigntools')
    
    install -d "$pkgdir/usr/lib/uak/install.d"
    install -D "$srcdir/75-sign-for-secure-boot.install" "$pkgdir/usr/lib/uak/install.d/75-sign-for-secure-boot.install"
}
