# Maintainer: crian <crian84 at gmail dot com>

pkgname=auto-cpufreq-git
pkgver=1.1.r0.gabe463c
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python-distro' 'python-psutil' 'python-click' 'python-power')
makedepends=('git' 'python-setuptools')
provides=('auto-cpufreq')
conflicts=('auto-cpufreq')
install=auto-cpufreq-git.install
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    depends+=()
    cd "${srcdir}/auto-cpufreq"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/auto-cpufreq/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/auto-cpufreq/README.md"
    cd "$srcdir/auto-cpufreq/scripts"
    install -Dm755 cpufreqctl.sh "$pkgdir/usr/bin/cpufreqctl"
    install -Dm644 auto-cpufreq.service "$pkgdir/usr/lib/systemd/system/auto-cpufreq.service"
}
