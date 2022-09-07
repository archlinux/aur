# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=cavalcade-git
pkgver=0.8.r12.gf6141c7
pkgrel=1
pkgdesc="GUI wrapper for C.A.V.A. utility"
arch=("any")
url="https://github.com/worron/cavalcade"
license=("GPL")
depends=("cava>=0.6"
         "gtk3>=3.18"
         "python>=3.5"
         "python-cairo"
         "python-gobject")
makedepends=("git" "python-setuptools")
optdepends=("gstreamer>=1.0: audio player support"
            "gst-plugins-good: required plugins for gstreamer"
            "python-pillow: auto color detection support")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/worron/cavalcade.git#branch=devel")
b2sums=("SKIP")

pkgver() {
  printf "%s" \
    $(git -C "${pkgname}" describe --long --tags \
      | sed "s/\([^-]*-g\)/r\1/;s/-/./g")
}

build() {
  cd "${pkgname}"

  python "setup.py" build
}

package() {
  cd "${pkgname}"

  python "setup.py" install \
    --optimize=1 \
    --prefix="/usr/" \
    --root="${pkgdir}" \
    --skip-build
}
