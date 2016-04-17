# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=boot-digest
pkgver=0.8
pkgrel=1
pkgdesc="Digest boot partition for disk encryption integrity"
arch=('any')
url="https://github.com/alonbl/boot-digest"
license=('MIT')
depends=('bash')
makedepends=('git')
source=('git+https://github.com/alonbl/boot-digest.git' 'boot-digest-check.service' 'boot-digest-mkinitcpio' 'boot-digest.mkinitcpio-hook' 'boot-digest-alert'  'boot-digest-alert.desktop' )
sha1sums=('SKIP'
          '948c773af5ac6963163179538bf6446fa821c3ed'
          '29e0e6005b319ed0d404a13f94e605f0c48895e1'
          '45b20e72bdc59d96bc07e8b339a560fef3af7e05'
          'f4c99af8914e8dd842a4a84b2945c5c2af2f5ba1'
          'f6c3dc2b5cd8fbd8b1f38936ebe167e2556aaef6')

install=boot-digest.install

package() {
    cd "$srcdir/$pkgname"
    sed -i '2,3d' boot-digest-mark
    install -Dm755 -t ${pkgdir}/usr/bin boot-digest-calc boot-digest-check boot-digest-mark
    install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname} LICENSE
    install -Dm644 -t ${pkgdir}/usr/share/doc/${pkgname} ChangeLog
    cd "$srcdir"
    install -Dm644 boot-digest.mkinitcpio-hook ${pkgdir}/usr/lib/initcpio/install/boot-digest
    install -Dm644 -t ${pkgdir}/usr/lib/systemd/system boot-digest-check.service 
    install -Dm755 -t ${pkgdir}/usr/bin boot-digest-alert boot-digest-mkinitcpio
    install -Dm644 -t ${pkgdir}/etc/xdg/autostart boot-digest-alert.desktop
}
