# Maintainer: Calogero e Angelo Scarnà <info@codelinsoft.it>
pkgname=clamav-gui
pkgver=1.1.8
pkgrel=1
pkgdesc="Graphical user interface for clamav and freshclam with an integrated service menu for Konqueror/Dolphin to scan files directly from your file manager."
arch=('x86_64')
url="https://github.com/wusel1007/clamav-gui"
license=(GPL-3.0-or-later)
depends=('qt6-base' 'qt6-connectivity' 'qt6-declarative' 'qt6-svg' 'qt6-tools' 'qt6-translations' 'clamav' 'desktop-file-utils')
source=("clamav-gui-${pkgver}.tar.gz::https://github.com/wusel1007/clamav-gui/archive/refs/tags/v${pkgver}.tar.gz"
        clamav-gui-QRegExp.patch::https://github.com/wusel1007/clamav-gui/commit/8abd8893356749b54e615aff5a167720862a17f3.patch
        )
sha256sums=('1e4a85618a8b681a834097fc87af78d1ba3ef892d7e31080506d989903826d9a'
            '8db343d8bd6e753ad25c50b06f62c67f05a285d541c1a012467eda73792f158a')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../clamav-gui-QRegExp.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  qmake6 PREFIX=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
  install -Dm644 "extra/ClamAV-GUI.desktop" "${pkgdir}/etc/xdg/autostart/ClamAV-GUI.desktop"
}
