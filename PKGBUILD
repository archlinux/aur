# Maintainer: skynet-devel <skynet-devel@mailbox.org>

_pkgname=usb-imager
pkgname=${_pkgname}-git
pkgver=1.0.r3.ga39ca8a
pkgrel=1
pkgdesc='GUI-Application to write bootable disk images to USB key.'
arch=(any)
url='https://gitlab.com/skynet-devel/usb-imager'
license=(GPL3)

makedepends=(
  'git'
  'python'
  'python-setuptools>=40.9.0'
)

depends=(
  'dbus'
  'udisks2'
  'python-importlib_resources'
  'python-gobject'
  'pyside2'
  'pyside2-tools'
  'hicolor-icon-theme'
)

source=("${pkgname}::git+https://gitlab.com/skynet-devel/usb-imager.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  echo "git-${pkgver}" > usb_imager/resources/app_version_git.txt
  python3 setup.py build

}

package() {
  cd "${srcdir}/${pkgname}"
  python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 'data/applications/usb-imager.desktop' "${pkgdir}/usr/share/applications/usb-imager.desktop"
  install -D -m644 'data/icons/hicolor/16x16/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/16x16/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/24x24/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/24x24/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/32x32/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/32x32/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/48x48/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/48x48/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/64x64/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/64x64/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/72x72/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/72x72/apps/usb-imager.png"
  install -D -m644 'data/icons/hicolor/128x128/apps/usb-imager.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/usb-imager.png"
}
