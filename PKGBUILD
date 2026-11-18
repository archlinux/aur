# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=pareto-gateway-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Pareto AI gateway: local AI model router with a spend and quality console (headless server, prebuilt)"
arch=('x86_64')
url="https://github.com/mohamadkhani/pareto-ai"
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
)
provides=('pareto-gateway')
conflicts=('pareto-gateway' 'pareto-ai' 'pareto-ai-bin')
source_x86_64=("https://github.com/mohamadkhani/pareto-ai/releases/download/v${pkgver}/pareto-gateway-${pkgver}-linux-x86_64.tar.gz")
# Checksum is injected by CI from the built release tarball (real b2sum, not SKIP).
b2sums_x86_64=('28bfb142bd87c9a9b1b44c3541ec1ad48acddd5e11eeb103ee5eb58180633655a915cb5ef176c1a2e1f61867fbc93a6a522834a812ac4137d9c84818f724bf43')

package() {
  cd "$srcdir/pareto-gateway-${pkgver}-linux-x86_64"

  install -Dm755 pareto-gateway \
    "$pkgdir/usr/bin/pareto-gateway"

  # Daemon: systemctl enable --now pareto-gateway
  install -Dm644 pareto-gateway.service \
    "$pkgdir/usr/lib/systemd/system/pareto-gateway.service"
  install -Dm644 pareto-gateway.sysusers \
    "$pkgdir/usr/lib/sysusers.d/pareto-gateway.conf"
  install -Dm644 pareto-gateway.conf \
    "$pkgdir/etc/pareto-gateway.conf"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
