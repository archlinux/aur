# Maintainer: Anand <your-github-username>
pkgname=vectorx-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="High-intensity GPU/CPU stress tester (Electron/WebGL)"
arch=('x86_64')
url="https://github.com/AnandRiftYT/VectorX_Benchmarker"
license=('MIT')
depends=('electron' 'libxss' 'nss')

# UPDATED LINK HERE:
source=("https://github.com/AnandRiftYT/VectorX_Benchmarker/releases/download/VectorX_v.1.0.0_First_Stable_Release/VectorXBenchmark-cpu-linux-x64.zip")
sha256sums=('cf81579c1dab59070f428c872ac7adff6e11a5ed2d880e111640bef2fc0f1a28')

package() {
    # 1. Create the directory
    install -dm755 "${pkgdir}/opt/${pkgname}"

    # 2. Copy everything from the zip (make sure path matches your extracted zip)
    cp -r "${srcdir}/VectorXBenchmark-cpu-linux-x64/." "${pkgdir}/opt/${pkgname}/"

    # 3. Create a WRAPPER instead of a symlink
    install -dm755 "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\ncd /opt/${pkgname} && ./VectorXBenchmark \"\$@\"" > "${pkgdir}/usr/bin/vectorx"

    # 4. Make the wrapper executable
    chmod +x "${pkgdir}/usr/bin/vectorx"
}
