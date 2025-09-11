# Maintainer: Sébastien Luttringer

pkgname=virtualbox-ext-oracle
pkgver=7.2.2
_filever="${pkgver}"
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack'
arch=('any')
url='https://www.virtualbox.org/'
license=('custom:PUEL')
depends=("virtualbox=${pkgver}")
optdepends=('rdesktop: client to connect vm via RDP')
options=('!strip')
install=virtualbox-ext-oracle.install
source=("https://download.virtualbox.org/virtualbox/${pkgver}/Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack")
noextract=("Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack")
sha256sums=('a7f5904e35b3c34c000f74e0364f1d1c0efdb126a4d3c4a264244959711c7f42')

prepare() {
  # shrink uneeded cpuarch
  [[ -d shrunk ]] || mkdir shrunk
  tar xfC "Oracle_VirtualBox_Extension_Pack-${_filever}.vbox-extpack" shrunk
  rm -r shrunk/{darwin*,solaris*,win*}
  tar -c --gzip --file shrunk.vbox-extpack -C shrunk .
}

package() {
  install -Dm 644 shrunk.vbox-extpack \
    "$pkgdir/usr/share/virtualbox/extensions/Oracle_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack"
  install -Dm 644 shrunk/ExtPack-license.txt \
    "$pkgdir/usr/share/licenses/${pkgname}/PUEL"
}

# vim:set ts=2 sw=2 et:
