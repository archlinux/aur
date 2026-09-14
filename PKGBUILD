# Maintainer: Attila Simon <atsitimolan@murena.io>
pkgname=digistorage-bin
pkgver=decf8db
pkgrel=1
pkgdesc="Digi Storage Desktop Client - Cloud storage client for Digi Romania"
arch=('x86_64')
url="https://storage.rcs-rds.ro"
depends=('gvfs')
license=('custom')
options=(!strip)
source=("digistorage-${pkgver}-linux-x86_64.tar.gz::https://storage.rcs-rds.ro/dl/apps/linux64"
        "digistorage.desktop")
sha256sums=('a1f701503bbe82aa558f3cf64b8f459df236c25f2b43991c305e9e283d4ea42f'
            'c7f64722db8ab612b1ad1de435236d109fc79ab392b4d877d911f35f0f8c16d2')

prepare() {
  cd "${srcdir}"
  tar -xf "digistorage-${pkgver}-linux-x86_64.tar.gz"
  cd "digistorage"
  rm -f "Install.desktop" "installer.sh"
}

package() {
  install -Dm644 "${srcdir}/digistorage.desktop" "${pkgdir}/usr/share/applications/digistorage.desktop"

  cd "${srcdir}/digistorage"

  install -dm755 "${pkgdir}/opt"
  cp -r . "${pkgdir}/opt/digistorage"

  install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  ln -s "/opt/digistorage/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/digistorage.png"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/digistorage/storagegui" "${pkgdir}/usr/bin/digistorage"
}
