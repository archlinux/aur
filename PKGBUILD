# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Maintainer: Marcin Nowak < marcin dot j dot nowak at gmail dot com >

pkgname=cpufreqctl
pkgver=10.1.2
pkgrel=3
pkgdesc="A intel_pstate CPU freq controller for regular user (extracted from extension 'CPU Power Manager for Gnome')"
arch=('any')
url="https://github.com/martin31821/cpupower"
source=(
    https://github.com/martin31821/cpupower/archive/v$pkgver.tar.gz
    )
sha256sums=('204dc95a45238e155a97120440d2cf83b55c488e7680dcf865bba0b10f308a97')
license=('GPL-3.0-or-later')
provides=('cpufreqctl')
depends=("bash")
makedepends=("make")

build() {
  cd "$srcdir/cpupower-${pkgver}"
  make
}

package() {
  cd "$srcdir/cpupower-${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 tool/cpufreqctl "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/polkit-1/actions"
  install -dm755 "$pkgdir/usr/share/polkit-1/rules.d"
  install -Dm755 data/10-mko.cpupower.setcpufreq.rules "$pkgdir/usr/share/polkit-1/rules.d/"
  install -Dm755 data/mko.cpupower.policy.in "$pkgdir/usr/share/polkit-1/actions/mko.cpupower.policy"


}
