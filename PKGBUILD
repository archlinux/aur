# Maintainer: izznogoood <ama@getmail.no>
# Contributor: FabioLolix

pkgname=startup-settings-git
pkgver=r45.516860c
pkgrel=1
pkgdesc="Manage Gnome3 startup Apps and Scripts"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/hant0508/startup-settings"
license=('unknown')
depends=('gtk3')
makedepends=('git')
provides=('startup-settings')
conflicts=('startup-settings')
source=("${pkgname}::git+https://github.com/hant0508/startup-settings.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}/src"
  install -Dm755 startup-settings "${pkgdir}/usr/bin/startup-settings"
  install -Dm644 gui.glade "${pkgdir}/usr/share/startup-settings/gui.glade"
  install -Dm755 startup-settings.desktop "${pkgdir}/usr/share/applications/startup-settings.desktop"
}