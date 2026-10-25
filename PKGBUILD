# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname='nutmeg-git'
pkgver=r36.55f1be1
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
sha256sums=('SKIP'
            '6d2e56eb294a6aae43e78642965558dd7cf6e8cbd002b67cb466699549227387'
            '7e5377d897aeb8871703aec36433dee26f6c4b7d0a30795f798f6c6298326b9c'
            '08b7ed946c9aa02f4172f8156d150ff195cced82fc52bd34f0c8f331a07bfb42'
            '9898bd2dbc99a3d8ca2512af9094daa84878c7d42feedad49818de413ede46a9')
source=('git+https://github.com/frolleks/nutmeg.git'
        'io.github.frolleks.Nutmeg.desktop'
        'io.github.frolleks.Nutmeg.Settings.desktop'
        'https://raw.githubusercontent.com/frolleks/nutmeg/refs/heads/main/nutmeg/data/nutmeg.svg'
        'roblox.svg')

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
  install -D "${srcdir}/roblox.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -D "${srcdir}/nutmeg.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
