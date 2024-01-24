# Maintainer:  JakobDev<jakobdev at gmx dot de>

pkgname=jdmrpackinstaller
pkgver=1.0
pkgrel=2
pkgdesc="Install Modrinth modpacks"
arch=("any")
url="https://codeberg.org/JakobDev/jdMrpackInstaller"
license=("GPL3")
depends=("python" "python-pyqt6" "python-minecraft-launcher-lib")
makedepends=("qt5-tools" "python-build" "python-setuptools" "python-installer" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdMrpackInstaller/archive/${pkgver}.tar.gz")
sha256sums=("bfeb29bf70ea1ada091f6d6f5db5c938d7f4590d5c8370132e49bc566fa529a1")

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
