# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Christian Häßler <arch@haessler.info>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-hyper-backup-explorer
pkgver=3.0.1.0156
_pkgver=3.0.1-0156
pkgrel=1
pkgdesc="A desktop tool for browsing, decrypting, and extracting different versions of backup data in Hyper Backup repositories"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/HyperBackupExplorer"
license=('unknown')
depends=('libxcrypt-compat')
options=('!strip')
source=(https://global.synologydownload.com/download/Utility/HyperBackupExplorer/${_pkgver}/Linux/${CARCH}/HyperBackupExplorer-${_pkgver}-linux.tar.bz2)
sha256sums=('5a36e4bc9ca31cb8737be63059f9506a17349c19546a4ff42fd17cc6f0a2e088')

prepare() {
    cd "${srcdir}"
}

package() {
    mkdir -p "${pkgdir}"/opt/Synology/HyperBackupExplorer
    install -Dm755 HyperBackupExplorer "${pkgdir}/opt/Synology/HyperBackupExplorer/HyperBackupExplorer"
    install -Dm755 QtWebEngineProcess "${pkgdir}/opt/Synology/HyperBackupExplorer/QtWebEngineProcess"
    install -Dm755 img_worker "${pkgdir}/opt/Synology/HyperBackupExplorer/img_worker"
    cp -r qt.conf help lib platforms plugins resources target translations "${pkgdir}/opt/Synology/HyperBackupExplorer"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf /opt/Synology/HyperBackupExplorer/HyperBackupExplorer "${pkgdir}/usr/bin/synology-hyper-backup-explorer"
}
