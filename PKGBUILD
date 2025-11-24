# Maintainer: xmp360 <1666451428@qq.com>
# Maintainer: Anysets <anysets@qq.com>
# Maintainer: shenmo <shenmo@spark-app.store>

pkgname=amber-package-manager
pkgver=1.1.5
pkgrel=1
pkgdesc="bwrap wrapper for install and running debs inside a Amber-PM container"
arch=('x86_64')
url="https://gitee.com/amber-ce/amber-pm/"
license=('custom')
depends=('bubblewrap' 'flatpak' 'polkit' 'systemd' 'procps-ng' 'coreutils' 'fuse-overlayfs')
optdepends=('dpkg: Enable amber-pm-convert (A tool to convert Debian packages for Amber-PM)')
conflicts=('ace-host-integration')
# provides=('amber-package-manager')

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm/repository/archive/${pkgver}.tar.gz")
sha256sums=('f0c8ae6e5732b879c58c88de44bdac63ff057347238776cae9313f1cf1df0f30')

install=amber-package-manager.install

package() {
    cd "$srcdir/amber-pm-${pkgver}/src"
    
    install -d "$pkgdir/var/lib/apm"
    cp -r etc "$pkgdir/"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"
    
    find "$pkgdir" -type d -exec chmod 755 {} \;
    
    find "$pkgdir/etc/profile.d" -name "*.sh" -exec chmod 755 {} \;
    find "$pkgdir/etc/X11/Xsession.d" -name "*" -exec chmod 755 {} \;
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
    find "$pkgdir/var/lib/apm/apm/files/bin" -type f -exec chmod 755 {} \;
    find "$pkgdir/var/lib/apm/apm/files/amber-ce-tools/bin-override" -type f -exec chmod 755 {} \;
    
    find "$pkgdir/usr/lib/systemd" -name "*.service" -exec chmod 644 {} \;
    find "$pkgdir/usr/lib/systemd/user-environment-generators" -type f -exec chmod 755 {} \;
    
    if [ -d "$pkgdir/usr/share/bash-completion/completions" ]; then
        chmod 644 "$pkgdir/usr/share/bash-completion/completions/"*
    fi
}
