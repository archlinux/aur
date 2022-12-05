pkgname=jddiff
pkgver=1.3
pkgrel=1
pkgdesc="A graphical cross platform diff viewer"
arch=("any")
url="https://gitlab.com/JakobDev/jdDiff"
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt6")
makedepends=("qt5-tools"  "python-build" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdDiff/-/archive/${pkgver}/jdDiff-${pkgver}.tar.gz")
sha256sums=("1cf73a2117db3c628a333e0fcfe08d80ab13b841b97adfb8be78e4fe2c0f584a")

build() {
      cd "jdDiff-${pkgver}"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdDiff-${pkgver}"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 "jdDiff/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.gitlab.JakobDev.jdDiff.svg"
    install -Dm644 "Data/com.gitlab.JakobDev.jdDiff.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "Data/com.gitlab.JakobDev.jdDiff.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
} 
