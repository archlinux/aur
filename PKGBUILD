# Maintainer: crian <crian84 at gmail dot com>

pkgname=auto-cpufreq-git
pkgver=r59.39f0e52
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python-distro' 'python-psutil' 'python-click')
makedepends=('git')
provides=('auto-cpufreq')
conflicts=('auto-cpufreq')
install=auto-cpufreq-git.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/auto-cpufreq"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/auto-cpufreq"
	install -Dm755 auto-cpufreq.py "$pkgdir/usr/bin/auto-cpufreq"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	cd "$srcdir/auto-cpufreq/scripts"
	install -Dm755 cpufreqctl.sh "$pkgdir/usr/bin/cpufreqctl"
	install -Dm644 auto-cpufreq.service "$pkgdir/etc/systemd/system/auto-cpufreq.service"
}
