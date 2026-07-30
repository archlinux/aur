# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cosmic-vrr-toggle-git
_srcname=cosmic-vrr-toggle
pkgver=r1.gc9e11fd
pkgrel=1
pkgdesc='Toggle COSMIC VRR and enable automatic VRR when GameMode activates'
arch=('any')
url='https://github.com/AdityaHebballe/cosmic-vrr-toggle'
license=('MIT')
depends=('bash' 'cosmic-randr' 'cosmic-session' 'gamemode' 'procps-ng' 'systemd')
makedepends=('git')
optdepends=('cosmic-external-osd-git: COSMIC-style on-screen feedback')
provides=('cosmic-vrr-toggle')
conflicts=('cosmic-vrr-toggle')
install="${pkgname}.install"
source=("${_srcname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf 'r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_srcname}"
  install -Dm755 vrr-toggle "${pkgdir}/usr/bin/cosmic-vrr-toggle"
  install -Dm755 gamemode-start \
    "${pkgdir}/usr/lib/cosmic-vrr-toggle/gamemode-start"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
