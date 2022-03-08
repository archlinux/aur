# Maintainer: Felix Golatofski <contact@xdfr.de>
# Maintainer: Christian Häßler <arch@haessler.info>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-hyper-backup-explorer
pkgver=3.0.0.0149
_pkgver=3.0.0-0149
pkgrel=3
pkgdesc="A desktop tool for browsing, decrypting, and extracting different versions of backup data in Hyper Backup repositories"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/HyperBackupExplorer"
license=('unknown')
depends=('qt5-base' 'gtk2' 'openssl-1.0' 'libxcrypt-compat')
options=('!strip')
source=(https://global.download.synology.com/download/Utility/HyperBackupExplorer/${_pkgver}/Linux/${CARCH}/HyperBackupExplorer-${_pkgver}-linux.tar.bz2)
sha256sums=('58605171a1fcc3f33117375c55ae738686667c85db3645ced23bb4f26545030f')

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
