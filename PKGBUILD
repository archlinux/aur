# Maintainer: Sébastien Luttringer
pkgname=virtualbox-ext-oracle
pkgver=6.1.0
pkgrel=1
pkgdesc='Oracle VM VirtualBox Extension Pack'
arch=('any')
url='https://www.virtualbox.org/'
license=('custom:PUEL')
options=('!strip')
install=virtualbox-ext-oracle.install
source=("https://download.virtualbox.org/virtualbox/$pkgver/Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack")
noextract=("Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack")
sha256sums=('b907e69a5bad4dcd8e831416a2118b744bad1656918712a2d2131e595357cad4')

prepare() {
  # shrink uneeded cpuarch
  [[ -d shrunk ]] || mkdir shrunk
  tar xfC "Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack" shrunk
  rm -r shrunk/{darwin*,solaris*,win*}
  tar -c --gzip --file shrunk.vbox-extpack -C shrunk .
}

package() {
  depends=('virtualbox')
  optdepends=('rdesktop: client to connect vm via RDP')
  install -Dm 644 shrunk.vbox-extpack \
    "$pkgdir/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack"
  install -Dm 644 shrunk/ExtPack-license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}

# vim:set ts=2 sw=2 et:
