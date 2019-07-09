# Contributor: Alexandre Bolelli <t3k0@live.com>
# Maintainer: Alexandre Bolelli <t3k0@live.com>

pkgname=powersave-git
pkgver=r2.180aa76
pkgrel=1
pkgdesc="Powersave for Dell Inspiron 15 Serie 5000 (i15-5558-B30)"
arch=('x86_64')
url="https://github.com/semeion/${pkgname%-git}"
conflicts=('indicator-powersave')
license=('GPL3')
makedepends=('git')
depends=('systemd')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    #cd "$srcdir/${pkgname%-git}"
    cd "${pkgname%-git}"
    # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    #cd "$srcdir"
    # add systemd service
    cd "../src/${pkgname%-git}"
    install -Dm0644 -- 00-powersave "${pkgdir}/usr/lib/systemd/system-sleep/00-powersave"
    install -Dm0644 -- 99-powersave.rules "${pkgdir}/etc/udev/rules.d/99-powersave.rules"
    install -Dm0644 -- low-battery "${pkgdir}/usr/bin/low-battery"
    install -Dm0644 -- low-battery.service "${pkgdir}/usr/lib/systemd/system/low-battery.service"
    install -Dm0644 -- low-battery.timer "${pkgdir}/usr/lib/systemd/system/low-battery.timer"
    install -Dm0644 -- throttle "${pkgdir}/usr/bin/throttle"
}
