# Maintainer: Marcin Nowak < marcin dot j dot nowak at gmail dot com >

pkgname=cpufreqctl
pkgver=8
pkgrel=1
pkgdesc="A intel_pstate CPU freq controller for regular user (extracted from extension 'CPU Power Manager for Gnome')"
arch=('x86_64')
url="https://github.com/martin31821/cpupower"
source=(
    https://github.com/martin31821/cpupower/archive/v$pkgver.tar.gz
    policy.patch
    cpufreqctl.patch
    )
sha256sums=(
    'a11696e2486620baf550f004a046d7c19938ca2c6dcdf698c6906c1d8bcba541'
    'b62e356b1d17bc2f14bf3369ff7f45d251032b200198b95371cac34fcced274b'
    'd4f1f34de1b146897d1c74fbefbc6577b397d7b47380de5255493f4a4fd38124'
    )
license=('GPL')
provides=('cpufreqctl')
depends=()
makedepends=()

build() {
  cd "$srcdir/cpupower-${pkgver}"
  cp mko.cpupower.policy.in ${pkgname}.policy
  patch -p0 ${pkgname}.policy < $srcdir/policy.patch
  patch -p0 ${pkgname} < $srcdir/cpufreqctl.patch
}

package() {
  cd "$srcdir/cpupower-${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 cpufreqctl "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/polkit-1/actions"
  install -Dm755 ${pkgname}.policy "$pkgdir/usr/share/polkit-1/actions/"

}
