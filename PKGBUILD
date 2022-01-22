# Maintainer:  Leonid Vaiman <vleon1@gmail.com>

_pkgname=pico-project-generator
pkgname=${_pkgname}-git
pkgver=54.c13f396
pkgrel=1
pkgdesc="A command line or GUI tool, written in Python, to automatically generate a Pico C SDK Project."
arch=('any')
url="https://github.com/raspberrypi/pico-project-generator"
license=('unknown')
depends=('python')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/raspberrypi/pico-project-generator.git
        pico-project-generator.desktop
        pico-project-generator.png
        pico-project-generator.sh)
sha256sums=('SKIP'
            'fdf71d1969c352fb98fe8860baf23892e9776bd393059c46ae8ce39c22064224'
            '8be90d3f77721015e3cb4966fd848d550c3c9515ca3aeff6458393cd37d53ce8'
            '974456d2ae99015606ddc0d9dc0805f26fc7acbd619e1c29858806cca4620436')

pkgver() {
  cd "${_pkgname}"
  # Format: ${commit-count}.${last-commit-hash}
  echo "$(git rev-list --all --count).$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm755 "$srcdir"/$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$srcdir"/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm644 "$srcdir"/$_pkgname.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png

  install -Dm644 "$srcdir"/$_pkgname/logo_alpha.gif "$pkgdir"/usr/share/$_pkgname/logo_alpha.gif
  install -Dm644 "$srcdir"/$_pkgname/pico_configs.tsv "$pkgdir"/usr/share/$_pkgname/pico_configs.tsv
  install -Dm644 "$srcdir"/$_pkgname/pico_project.py "$pkgdir"/usr/share/$_pkgname/pico_project.py
  install -Dm644 "$srcdir"/$_pkgname/README.md "$pkgdir"/usr/share/$_pkgname/README.md
}
