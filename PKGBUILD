# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=flycasual-bin
pkgver=2.0
pkgrel=1
pkgdesc="Fan-made \"Star Wars: X-Wing Miniatures Game\" simulator"
arch=('x86_64')
url="https://github.com/Sandrem/FlyCasual"
license=('MIT')
depends=('gcc-libs'
         'zlib')

source=("https://github.com/Sandrem/FlyCasual/releases/download/${pkgver}/FlyCasual-v${pkgver}-Linux.zip"
        "https://raw.githubusercontent.com/Sandrem/FlyCasual/${pkgver}/LICENSE"
        'flycasual.sh'
        'flycasual.desktop')

sha256sums=('1f16645aabb566b0efb1377f427a3a9ee81ad873ee3bb3964b35207a16cf1b1b'
            '615de0833ce2cdb29dd43d9f8214700ad8dd1d60e94392745eeb24b972a2b9e7'
            '07980d05ff1f158b381d5a903d98d593ed72b5ffaaa99ae481e2657ac2901c34'
            '4505e7f12836a925190d0d0ebb61e5a2065ac403e8b86bef286e19eb24324573')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/flycasual.sh" "${pkgdir}/usr/bin/flycasual"
  install -Dm755 "${srcdir}/FlyCasual/FlyCasual.x86_64" "${pkgdir}/opt/FlyCasual/FlyCasual"
  install -Dm644 "${srcdir}/FlyCasual/UnityPlayer.so" "${pkgdir}/opt/FlyCasual/"

  install -dm755 "${pkgdir}/opt/FlyCasual/FlyCasual_Data"
  cp -a "${srcdir}/FlyCasual/FlyCasual_Data/"* "${pkgdir}/opt/FlyCasual/FlyCasual_Data/"
  cp -a "${srcdir}/FlyCasual/Customizable/"* "${pkgdir}/opt/FlyCasual/Customizable/"

  install -Dm644 "${srcdir}/flycasual.desktop" "${pkgdir}/usr/share/applications/flycasual.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
