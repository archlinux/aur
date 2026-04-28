# Maintainer: Konstantos Jim <konstantosjim@gmail.com>
pkgname=vbarch-auditd-config-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="Hardened auditd configuration with broad security event logging for vbarch"
arch=('any')
license=('MIT')
depends=('audit')
conflicts=('vbarch-auditd-config')
backup=('etc/audit/rules.d/10-general.rules' 'etc/audit/rules.d/99-lock.rules')
source=("$pkgname::git+https://gitlab.com/vbarch/auditd-configuration.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 10-general.rules "$pkgdir/etc/audit/rules.d/10-general.rules"
    install -Dm644 99-lock.rules "$pkgdir/etc/audit/rules.d/99-lock.rules"
}
