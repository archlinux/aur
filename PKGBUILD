# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdmrpackinstaller
pkgver=1.0
pkgrel=1
pkgdesc="Install Modrinth modpacks"
arch=("any")
url="https://codeberg.org/JakobDev/jdMrpackInstaller"
license=("GPL3")
depends=("python" "python-pyqt6" "python-minecraft-launcher-lib")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMrpackInstaller/archive/${pkgver}.tar.gz")
sha256sums=("8efa998975b654ce8abc77346709be5e3daefb7b7f7022ff33e2f9449086d68c")

build() {
      cd "jdmrpackinstaller"
      python -m build --wheel --no-isolation
}

package() {
    cd "jdmrpackinstaller"
    python -m installer --destdir "$pkgdir" dist/*.whl
    python install-unix-datafiles.py --prefix "${pkgdir}/usr"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
