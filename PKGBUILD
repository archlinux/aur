# Maintainer: Jeff Henson <jeff at henson dot io>
pkgname=virtualbox-bin-ext-oracle
pkgver=5.0.4
pkgrel=1
pkgdesc='Oracle VirtualBox Extension Pack for the virtualbox-bin package'
arch=('any')
url='http://www.virtualbox.org/'
depends=('virtualbox-bin')
conflits=('virtualbox-ext-oracle')
optdepends=('rdesktop: client to connect vm via RDP')
license=('custom:PUEL')
options=('!strip')
source=("http://download.virtualbox.org/virtualbox/$pkgver/Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack")
noextract=("Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack")
md5sums=('8acd6033201f1c59effc66b177192f4f')

prepare() {
  [[ -d Oracle_VM_VirtualBox_Extension_Pack ]] || mkdir Oracle_VM_VirtualBox_Extension_Pack
  tar xfC "Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack" Oracle_VM_VirtualBox_Extension_Pack
  rm -r Oracle_VM_VirtualBox_Extension_Pack/{darwin*,solaris*,win*}
}

package() {
  mkdir -p "$pkgdir/opt/VirtualBox/ExtensionPacks"
  cp -R "$srcdir/Oracle_VM_VirtualBox_Extension_Pack" "$pkgdir/opt/VirtualBox/ExtensionPacks"

  install -Dm 644 \
    "$srcdir/Oracle_VM_VirtualBox_Extension_Pack/ExtPack-license.txt" "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}

# vim:set ts=2 sw=2 et:
