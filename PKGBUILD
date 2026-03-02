pkgname=uptater-bin
pkgver=1.0.1.3
pkgrel=1
pkgdesc="Clean, robust GUI for managing Arch Linux packages and AUR updates"
arch=('x86_64')
license=('GPL3')
options=('!debug') # This prevents the creation of the uptater-debug package
url="https://github.com/gytdoo/uptater"

# Only the runtime dependencies are needed! No cmake or base-devel required.
depends=('qt6-base' 'qtermwidget' 'pacman-contrib' 'curl')
optdepends=('reflector: for mirrorlist management')

# Tell pacman that this satisfies the requirement for "uptater"
provides=('uptater')
conflicts=('uptater' 'uptater-git')

# Download the pre-compiled binary from the release, and the assets from the tag
source=("uptater-${pkgver}::https://github.com/gytdoo/uptater/releases/download/v${pkgver}/uptater"
        "uptater.desktop::https://raw.githubusercontent.com/gytdoo/uptater/v${pkgver}/uptater.desktop"
        "icon.png::https://raw.githubusercontent.com/gytdoo/uptater/v${pkgver}/icon.png")

# Generate these by running: updpkgsums
sha256sums=('7212b9fffbe2c337a86ce8656c9182c5c34cf1f90079f795260608a28d6e540e'
            '0cc85096101da79621e0b928158bd5803669db0fa8350946be5e05d2962a5239'
            '04b5e5cae018cae45efccfa8d5bca866fbac724a04063ce51115cdd1608e9683')

package() {
  # Install the pre-compiled executable directly
  install -Dm755 "${srcdir}/uptater-${pkgver}" "${pkgdir}/usr/bin/uptater"

  # Install the launcher and icon
  install -Dm644 "${srcdir}/uptater.desktop" "${pkgdir}/usr/share/applications/uptater.desktop"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/uptater.png"
}
