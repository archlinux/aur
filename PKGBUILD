# Maintainer  : Luca Weiss       <luca (at) z3ntu (dot) xyz>
# Contributor : hexchain         <i at hexchain.org>
# Contributor : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc-py3-git
_pkgname=osc
pkgver=0.162.1.r93.ga455fd8
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
makedepends=('git')
depends=('python'
         'python-m2crypto')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            )
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/openSUSE/osc.git#branch=python3")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

  ln -s osc-py3-wrapper.py "${pkgdir}/usr/bin/osc"

  install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
  install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
}

# vim:set sts=2 ts=2 sw=2 et:
