# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>
pkgname=opencl-caps-viewer
pkgver=1.0
_pkgtag=1.00
pkgrel=1
pkgdesc="OpenCL Hardware Capability Viewer"
arch=("x86_64")
depends=("opencl-icd-loader" "qt5-base")
url="https://opencl.gpuinfo.org/"
license=("GPL2")

source=("opencl-caps-viewer::git+https://github.com/SaschaWillems/OpenCLCapsViewer.git#tag=${_pkgtag}"
        "git+https://github.com/KhronosGroup/OpenCL-Headers.git")

sha256sums=("SKIP"
            "SKIP")

prepare() {
  cd "$srcdir/${pkgname}"
  git submodule init
  git config submodule.OpenCL-Headers.url "$srcdir/OpenCL-Headers"
  git submodule update
}

build() {
  cd "$srcdir/${pkgname}"
  qmake
  make
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -m755 "${srcdir}/${pkgname}"/OpenCLCapsViewer "${pkgdir}"/usr/bin/OpenCLCapsViewer

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 "${srcdir}/${pkgname}"/OpenCLCapsViewer.desktop "${pkgdir}"/usr/share/applications/OpenCLCapsViewer.desktop

  install -dm755 "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}/${pkgname}"/Resources/icon.png "${pkgdir}"/usr/share/icons/openclCapsViewer.png
}
