# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.6.13.1
pkgrel=2
pkgdesc='Finds outdated running applications in your system'
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-psutil' 'python-lxml' 'python-dbus' 'pyalpm')
optdepends=("python-argcomplete: bash completion")
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz"
        "tracer.bash_completion"
        'tracer.hook')
sha256sums=('c28a8a9f3c371e7e0797981191223ed2b04504bbd4477ab521f6aae20c0b9593'
            'd710122aac825c70634fa925cfba0de88a8ab22882fd3575aad1ab6f7924ed1b'
            'cade46472c45fef3f8ec1eb762cd4469d37f2966f65f63ee89887941e7896452')

package() {
  cd tracer-tracer-$pkgver-1
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm0644 ../tracer.hook "$pkgdir"/usr/share/libalpm/hooks/50-tracer.hook
  # exit cleanly if python-argcomplete is not installed
  install -m0644 ../tracer.bash_completion "$pkgdir"/etc/bash_completion.d/
}
