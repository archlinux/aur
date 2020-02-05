# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=('unifed-arch-kernel' 'unifed-arch-kernel-secure-boot')
pkgbase=unifed-arch-kernel
pkgver=0.0.6
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
md5sums=('aa4f4f6300e708d6ee67b86414a6ede1'
         '3f5756050aaf4c0a13a11167682565a1'
         'cf19112a5294756657e8e2e3ebf6226d'
         'c07998165fc01a2f5e7d453b51a7a024'
         '9105de5ff7f384b1e48bdd4972b87917'
         '2cad8b6d2879e7c6f1ee6957d3b69f97'
         '9752535dff10105c003f9108528bd50a')

package_unifed-arch-kernel() {
    depends=('pacman' 'systemd' 'bash' 'mkinitcpio' 'binutils' 'coreutils')
    backup=(etc/uak/config)
    
    install -d "$pkgdir/etc/uak/install.d"
    install -d "$pkgdir/usr/lib/uak/install.d"

    install -Dm755 "$srcdir/uak" "$pkgdir/usr/bin/uak"
    install -Dm755 "$srcdir/uak-script" "$pkgdir/usr/share/libalpm/scripts/uak-script"
    install -Dm644 "$srcdir/config" "$pkgdir/etc/uak/config"
    install -Dm755 "$srcdir/50-generate-efistub.install" "$pkgdir/usr/lib/uak/install.d/50-generate-efistub.install"
    install -Dm644 "$srcdir/95-unifed-arch-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks/95-unifed-arch-kernel-install.hook"
    install -Dm644 "$srcdir/55-unifed-arch-kernel-remove.hook" "$pkgdir/usr/share/libalpm/hooks/55-unifed-arch-kernel-remove.hook"
}

package_unifed-arch-kernel-secure-boot() {
    depends=('unifed-arch-kernel' 'sbsigntools')
    
    install -d "$pkgdir/usr/lib/uak/install.d"
    install -Dm755 "$srcdir/75-sign-for-secure-boot.install" "$pkgdir/usr/lib/uak/install.d/75-sign-for-secure-boot.install"
}
