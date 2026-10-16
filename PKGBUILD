# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname='nutmeg-git'
pkgver=r23.3eff518
pkgrel=1
pkgdesc='Play macOS Roblox on Linux.'
arch=('any')
url='https://github.com/frolleks/nutmeg.git'
license=('GPL3')
depends=('python3' 'python-gobject' 'gtk4' 'vulkan-driver' 'xdg-utils')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('rosemary: System-level rosemary runner')
provides=(nutmeg)
conflicts=(nutmeg)
md5sums=('SKIP'
         '37a0c7731283b65fd56da7c6f66e59d5'
         '9b22356068488149107a4505b9fc8ba7')
source=('git+https://github.com/frolleks/nutmeg.git'
        'io.github.frolleks.Nutmeg.desktop'
        'io.github.frolleks.Nutmeg.Settings.desktop')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "${srcdir}/io.github.frolleks.Nutmeg.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "${srcdir}/io.github.frolleks.Nutmeg.Settings.desktop" -t "$pkgdir/usr/share/applications"
}
